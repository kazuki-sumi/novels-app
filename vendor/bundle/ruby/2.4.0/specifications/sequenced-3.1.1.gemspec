# -*- encoding: utf-8 -*-
# stub: sequenced 3.1.1 ruby lib

Gem::Specification.new do |s|
  s.name = "sequenced".freeze
  s.version = "3.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Derrick Reimer".freeze]
  s.date = "2016-01-30"
  s.description = "Sequenced is a gem that generates scoped sequential IDs for ActiveRecord models.".freeze
  s.email = ["derrickreimer@gmail.com".freeze]
  s.homepage = "https://github.com/djreimer/sequenced".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "2.6.14".freeze
  s.summary = "Generate scoped sequential IDs for ActiveRecord models".freeze

  s.installed_by_version = "2.6.14" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<activesupport>.freeze, [">= 3.0"])
      s.add_runtime_dependency(%q<activerecord>.freeze, [">= 3.0"])
      s.add_development_dependency(%q<rails>.freeze, [">= 3.1"])
    else
      s.add_dependency(%q<activesupport>.freeze, [">= 3.0"])
      s.add_dependency(%q<activerecord>.freeze, [">= 3.0"])
      s.add_dependency(%q<rails>.freeze, [">= 3.1"])
    end
  else
    s.add_dependency(%q<activesupport>.freeze, [">= 3.0"])
    s.add_dependency(%q<activerecord>.freeze, [">= 3.0"])
    s.add_dependency(%q<rails>.freeze, [">= 3.1"])
  end
end