# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "osx_tools/version"

Gem::Specification.new do |s|
  s.name        = "osx_tools"
  s.version     = OSXTools::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Chris Geihsler"]
  s.email       = ["chris@geihsler.net"]
  s.homepage    = ""
  s.summary     = %q{A ruby gem to access OSX command line tools from ruby.}
  s.description = %q{.}

  #s.rubyforge_project = "osx_tools"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'rspec', '~>2.5.0'
  s.add_dependency 'plist'
end
