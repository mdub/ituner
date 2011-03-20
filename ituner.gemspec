# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "ituner/version"

Gem::Specification.new do |gem|
  
  gem.name        = "ituner"
  gem.summary     = "control iTunes using Ruby"
  gem.homepage    = "http://github.com/mdub/ituner"
  
  gem.version     = ITuner::VERSION
  gem.platform    = Gem::Platform::RUBY
  
  gem.authors     = ["Mike Williams"]
  gem.email       = ["mdub@dogbiscuit.org"]

  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency "rb-appscript"
  
end
