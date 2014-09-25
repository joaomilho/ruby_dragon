# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_dragon/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby_dragon"
  spec.version       = RubyDragon::VERSION
  spec.authors       = ["Juan Lulkin"]
  spec.email         = ["juan.lulkin@klarna.com"]
  spec.summary       = %q{A DSL for Dragon Dictate commands}
  spec.description   = %q{A DSL for Dragon Dictate commands}
  spec.homepage      = ""
  spec.license       = "MIT"

  #spec.files         = `git ls-files -z`.split("\x0")
  #spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rspec"
end
