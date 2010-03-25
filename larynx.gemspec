# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{larynx}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Adam Meehan"]
  s.autorequire = %q{larynx}
  s.date = %q{2010-03-25}
  s.default_executable = %q{larynx}
  s.description = %q{}
  s.email = %q{adam.meehan@gmail.com}
  s.executables = ["larynx"]
  s.extra_rdoc_files = ["README.rdoc"]
  s.files = ["MIT-LICENSE", "README.rdoc", "Rakefile", "lib/larynx", "lib/larynx/application.rb", "lib/larynx/call_handler.rb", "lib/larynx/callbacks.rb", "lib/larynx/command.rb", "lib/larynx/commands.rb", "lib/larynx/fields.rb", "lib/larynx/form.rb", "lib/larynx/logger.rb", "lib/larynx/observable.rb", "lib/larynx/prompt.rb", "lib/larynx/response.rb", "lib/larynx/restartable_timer.rb", "lib/larynx/session.rb", "lib/larynx/version.rb", "lib/larynx.rb", "spec/fixtures", "spec/fixtures/answer.rb", "spec/fixtures/channel_data.rb", "spec/fixtures/dtmf.rb", "spec/fixtures/execute.rb", "spec/fixtures/execute_complete.rb", "spec/fixtures/reply_ok.rb", "spec/larynx", "spec/larynx/call_handler_spec.rb", "spec/larynx/command_spec.rb", "spec/larynx/eventmachince_spec.rb", "spec/larynx/fields_spec.rb", "spec/larynx/prompt_spec.rb", "spec/larynx_spec.rb", "spec/spec_helper.rb", "examples/guess.rb", "examples/guess_form.rb", "examples/multiple_apps.rb", "bin/larynx"]
  s.homepage = %q{http://github.com/adzap/larynx}
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{larynx}
  s.rubygems_version = %q{1.3.6}
  s.summary = %q{}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
