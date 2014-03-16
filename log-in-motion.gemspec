# -*- encoding: utf-8 -*-
require File.expand_path('../lib/log_in_motion/version', __FILE__)

Gem::Specification.new do |s|
  s.name        = "log-in-motion"
  s.version     = MotionLogger::VERSION
  s.authors     = ["Steve Books"]
  s.homepage    = "https://github.com/stevebooks/log-in-motion"
  s.summary     = "Simple logger for RubyMotion"
  s.description = "Simple logger for RubyMotion"

  s.files         = `git ls-files`.split($\)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_development_dependency 'rake'
end
