require File.expand_path("../lib/lcbo/version", __FILE__)

Gem::Specification.new do |s|
  s.name        = 'lcbo'
  s.version     = LCBO::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ['Carsten Nielsen']
  s.email       = ['heycarsten@gmail.com']
  s.homepage    = 'http://github.com/heycarsten/lcbo'
  s.summary     = 'Library for scraping and parsing LCBO data.'
  s.description = 'Contains components for scraping and normalizing LCBO data.'

  s.required_rubygems_version = '>= 1.3.6'

  # lol - required for validation
  s.rubyforge_project         = 'lcbo'

  # If you have other dependencies, add them here
  s.add_dependency 'typhoeus',    '0.1.29'
  s.add_dependency 'addressable', '2.1.2'
  s.add_dependency 'nokogiri',    '1.4.2'
  s.add_dependency 'yajl-ruby',   '0.7.7'

  # If you need to check in files that aren't .rb files, add them here
  s.files        = Dir["{lib}/**/*.rb", '*.md']
  s.require_path = 'lib'

  # If you need an executable, add it here
  # s.executables = ["newgem"]

  # If you have C extensions, uncomment this line
  # s.extensions = "ext/extconf.rb"
end
