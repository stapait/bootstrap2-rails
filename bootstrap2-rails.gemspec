# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "bootstrap2-rails/version"

Gem::Specification.new do |s|
  s.name        = "bootstrap2-rails"
  s.version     = BootstrapRails::VERSION
  s.authors     = ["Fabio Stapait"]
  s.email       = ["stapait@gmail.com"]
  s.homepage    = "https://github.com/stapait/bootstrap2-rails"
  s.summary     = %q{This is a scaffold replacement with a Twitter Bootstrap look}
  s.description = %q{This is a scaffold replacement with a Twitter Bootstrap look}

  s.rubyforge_project = "bootstrap2-rails"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
  s.add_dependency "will_paginate"
end
