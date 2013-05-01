# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "messenger"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Shelburne"]
  s.date = "2013-05-01"
  s.description = ""
  s.email = "shelburt02@gmail.com"
  s.executables = ["messenger.js"]
  s.extra_rdoc_files = ["CHANGELOG", "LICENSE", "README.rdoc", "bin/messenger.js", "lib/messenger.rb", "lib/messenger/symbols.rb"]
  s.files = ["CHANGELOG", "Gemfile", "Gemfile.lock", "LICENSE", "Manifest", "README.rdoc", "Rakefile", "assets/scripts/coffee/messenger/factory/builders/multi_signal_dismissed_builder.coffee", "assets/scripts/coffee/messenger/factory/builders/signal_dismissed_builder.coffee", "assets/scripts/coffee/messenger/factory/builders/time_dismissed_builder.coffee", "assets/scripts/coffee/messenger/factory/builders/user_confirm_builder.coffee", "assets/scripts/coffee/messenger/factory/builders/user_dialogue_builder.coffee", "assets/scripts/coffee/messenger/factory/message_factory.coffee", "assets/scripts/coffee/messenger/message_queue.coffee", "assets/scripts/coffee/messenger/messages/message.coffee", "assets/scripts/coffee/messenger/messages/multi_signal_dismissed_message.coffee", "assets/scripts/coffee/messenger/messages/signal_dismissed_message.coffee", "assets/scripts/coffee/messenger/messages/time_dismissed_message.coffee", "assets/scripts/coffee/messenger/messages/user_confirm_message.coffee", "assets/scripts/coffee/messenger/messages/user_dialogue_message.coffee", "assets/scripts/coffee/messenger/system_message_manager.coffee", "assets/scripts/coffee/patches.coffee", "assets/scripts/js/lib/define_property.polyfill.js", "assets/scripts/js/lib/jquery.js", "bin/messenger.js", "config/assets.rb", "lib/messenger.rb", "lib/messenger/symbols.rb", "messenger.gemspec", "spec/jasmine.yml", "spec/runner.html", "spec/support/classes.coffee", "spec/support/helpers.coffee", "spec/support/mocks.coffee", "spec/support/objects.coffee", "spec/support/requirements.coffee", "spec/tests/factory/message_factory_spec.coffee", "spec/tests/message_queue_spec.coffee", "spec/tests/messages/message_spec.coffee", "spec/tests/messages/multi_signal_dismissed_message_spec.coffee", "spec/tests/messages/signal_dismissed_message_spec.coffee", "spec/tests/messages/time_dismissed_message_spec.coffee", "spec/tests/messages/user_confirm_message_spec.coffee", "spec/tests/messages/user_dialogue_message_spec.coffee", "spec/tests/system_messages_spec.coffee"]
  s.homepage = "https://github.com/tshelburne/GITHUB_NAME"
  s.rdoc_options = ["--line-numbers", "--inline-source", "--title", "Messenger", "--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = "messenger"
  s.rubygems_version = "1.8.24"
  s.summary = ""

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<jasmine>, [">= 0"])
      s.add_development_dependency(%q<jasmine-headless-webkit>, [">= 0"])
    else
      s.add_dependency(%q<jasmine>, [">= 0"])
      s.add_dependency(%q<jasmine-headless-webkit>, [">= 0"])
    end
  else
    s.add_dependency(%q<jasmine>, [">= 0"])
    s.add_dependency(%q<jasmine-headless-webkit>, [">= 0"])
  end
end
