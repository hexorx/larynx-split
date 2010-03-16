module Larynx
  class CallHandler < EventMachine::Protocols::HeaderAndContentProtocol
    include Observable

    attr_reader :state, :session, :input, :observers

    def connect(&block)
      execute ApiCommand.new('connect', &block)
    end

    def answer(&block)
      execute AppCommand.new('answer', &block)
    end

    def hangup(&block)
      execute AppCommand.new('hangup', &block)
    end

    def playback(text, options={}, &block)
      execute AppCommand.new('playback', text, options, &block)
    end
    alias_method :play, :playback

    def speak(text, options={}, &block)
      execute AppCommand.new('speak', text, options, &block)
    end

    def phrase(text, options={}, &block)
      execute AppCommand.new('phrase', text, options, &block)
    end

    def prompt(options={}, &block)
      execute Prompt.new(self, options, &block).command
    end

    def subscribe_to_events(&block)
      execute ApiCommand.new('myevents', &block)
    end

    def filter_events(&block)
      execute ApiCommand.new('filter', "Unique-ID #{@session.unique_id}", &block)
    end

    def linger_for_events(&block)
      execute ApiCommand.new('linger', &block)
    end

    def break!
      execute AppCommand.new('break'), true
    end

    # EM hook which is run when call is received
    def post_init
      @queue, @input, @timers = [], [], {}
      @state = :initiated
      connect {
        @session = Session.new(@response.header)
        log "Call received from #{caller_id}"
        @state = :connected
        Larynx.fire_callback(:connect, self)
        start_session
      }
      send_next_command
    end

    def start_session
      subscribe_to_events {
        filter_events {
          linger_for_events
          answer {
            log 'Answered call'
            @state = :ready
            Larynx.fire_callback(:answer, self)
          }
        }
      }
    end

    def called_number
      @session[:caller_destination_number]
    end

    def caller_id
      @session[:caller_caller_id_number]
    end

    def interrupt_command
      if @state == :executing && current_command.interruptable?
        break!
      end
    end

    def clear_input
      @input = []
    end

    def execute(command, immediately=false)
      log "Queued: #{command.name}"
      if immediately
        @queue.unshift command
        send_next_command
      else
        @queue << command
      end
      command
    end

    def timer(name, timeout, &block)
      @timers[name] = [EM::Timer.new(timeout) {
        timer = @timers.delete(name)
        timer[1].call if timer[1]
        notify_observers :timed_out
        send_next_command if @state == :ready
      }, block]
    end

    def cancel_timer(name)
      if timer = @timers.delete(name)
        timer[0].cancel
        send_next_command if @state == :ready
      end
    end

    def cancel_all_timers
      @timers.values.each {|t| t[0].cancel }
    end

    def stop_timer(name)
      if timer = @timers.delete(name)
        timer[0].cancel
        timer[1].call if timer[1]
        send_next_command if @state == :ready
      end
    end

    def restart_timer(name)
      if timer = @timers[name]
        timer[0].restart
      end
    end

    def cleanup
      break! if @state == :executing
      cancel_all_timers
      clear_observers!
    end

    def receive_request(header, content)
      @response = Response.new(header, content)

      case
      when @response.reply? && current_command.is_a?(ApiCommand)
        log "Completed: #{current_command.name}"
        finalize_command
        send_next_command
      when @response.executing?
        log "Executing: #{current_command.name}"
        run_command_setup
        @state = :executing
      when @response.executed? && current_command
        finalize_command
        send_next_command unless command_broken?
        @state = :ready
      when @response.dtmf?
        log "Button pressed: #{@response.body[:dtmf_digit]}"
        handle_dtmf
      when @response.speech?
      when @response.disconnect?
        log "Disconnected."
        cleanup
        notify_observers :hungup
        Larynx.fire_callback(:hungup, self)
        @state = :waiting
      end
    end

    def handle_dtmf
      @input << @response.body[:dtmf_digit]
      interrupt_command
      notify_observers :dtmf_received, @response.body[:dtmf_digit]
    end

    def current_command
      @queue.first
    end

    def last_command
      @last_command
    end

    def command_broken?
      last_command && last_command.command == 'break'
    end

    def run_command_setup
      current_command.fire_callback :before
    end

    def finalize_command
      if command = @queue.shift
        command.fire_callback :after
        @last_command = command
      end
    end

    def send_next_command
      if current_command
        send_data current_command.to_s
      end
    end

    def log(msg)
      time = Time.now
      usec = (".#{time.usec}".to_f * 1_000_000).to_i
      puts "[#{time.strftime('%F %T')}.#{usec}] #{msg.strip}"
    end

  end
end
