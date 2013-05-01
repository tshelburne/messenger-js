# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "messenger"
  s.version = "0.0.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.2") if s.respond_to? :required_rubygems_version=
  s.authors = ["Tim Shelburne"]
  s.date = "2013-05-01"
  s.description = ""
  s.email = "shelburt02@gmail.com"
  s.extra_rdoc_files = ["CHANGELOG", "LICENSE", "README.rdoc", "lib/messenger.rb", "lib/messenger/symbols.rb"]
  s.files = ["CHANGELOG", "Gemfile", "Gemfile.lock", "messenger.gemspec", "LICENSE", "Manifest", "README.rdoc", "Rakefile", "assets/scripts/coffee/library.coffee", "config/assets.rb", "lib/messenger.rb", "lib/messenger/symbols.rb", "spec/jasmine.yml", "spec/support/classes.coffee", "spec/support/helpers.coffee", "spec/support/mocks.coffee", "spec/support/objects.coffee", "spec/support/requirements.coffee"]
  s.homepage = "https://github.com/tshelburne/messenger-js"
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
