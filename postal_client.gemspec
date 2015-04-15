# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'postal_client/version'

Gem::Specification.new do |spec|
  spec.name          = "postal_client"
  spec.version       = PostalClient::VERSION
  spec.authors       = ["Anders Emil Nielsen"]
  spec.email         = ["aemilnielsen@gmail.com"]

  spec.summary       = %q{Client for fetching postal data}
  spec.description   = %q{Ruby library including a client for fetching postal data}
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.8", ">= 1.8.5"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.2", ">= 3.2.0"
  spec.add_development_dependency "webmock", "~> 1.21"

  spec.add_dependency "faraday", "~> 0.9.1"
  spec.add_dependency "excon", "~> 0.44"
end
