module Larynx
  class NoPromptCommandValue < StandardError; end

  class Prompt
    attr_reader :call

    def initialize(call, options, &block)
      @call, @options, @block = call, options, block
      @options.reverse_merge!(:bargein => true, :timeout => 10, :interdigit_timeout => 3, :termchar => '#')
      raise NoPromptCommandValue, "No output command value supplied. Use one of playback, speak or phrase keys." if command_name.blank?
    end

    def command
      @command ||= AppCommand.new(command_name, message, :bargein => @options[:bargein]).
        before { call.clear_input }.
        after  {
          if prompt_finished?
            finalise
          else
            call.add_observer! self
            add_digit_timer
            add_input_timer
          end
        }
    end

    def input
      (call.input.last == termchar ? call.input[0..-2] : call.input).join
    end

    def prompt_finished?
      call.input.last == termchar || call.input.size == maximum_length
    end

    def termchar
      @options[:termchar]
    end

    def maximum_length
      @options[:max_length] || @options[:length]
    end

    def command_name
      ([:play, :speak, :phrase] & @options.keys).first.to_s
    end

    def message
      @options[command_name.to_sym]
    end

    def finalise
      call.remove_observer! self
      @block.call(input)
    end

    def dtmf_received(digit)
      if prompt_finished?
        call.stop_timer(:input)
        call.cancel_timer(:digit)
      else
        call.restart_timer(:digit)
      end
    end

    def add_digit_timer
      call.timer(:digit, @options[:interdigit_timeout]) {
        call.cancel_timer :input
        finalise
      }
    end

    def add_input_timer
      call.timer(:input, @options[:timeout]) {
        call.cancel_timer :digit
        finalise
      }
    end
  end
end