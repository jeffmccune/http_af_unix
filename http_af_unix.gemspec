# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'http_af_unix/version'

Gem::Specification.new do |spec|
  spec.name          = "http_af_unix"
  spec.version       = HTTPAFUnix::VERSION
  spec.authors       = ["Jeff McCune"]
  spec.email         = ["jeff@puppetlabs.com"]
  spec.description   = %q{Simple HTTP server running over AF_UNIX domain socket}
  spec.summary       = %q{Simple HTTP server running over AF_UNIX domain socket}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "unicorn"
  spec.add_dependency "sinatra"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
