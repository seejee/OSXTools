# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "osx_volume_manager/version"

Gem::Specification.new do |s|
  s.name        = "osx_volume_manager"
  s.version     = OsxVolumeManager::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Chris Geihsler"]
  s.email       = ["chris@geihsler.net"]
  s.homepage    = ""
  s.summary     = %q{A ruby gem to manage disk volumes in Apple Mac OSX.}
  s.description = %q{Manage OSX disk volumes.}

  s.rubyforge_project = "osx_volume_manager"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_development_dependency 'rspec', '~>2.5.0'
end
