# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "hold_please/version"

Gem::Specification.new do |spec|
  spec.name          = "hold_please"
  spec.version       = HoldPlease::VERSION
  spec.authors       = ["Brandon Weiss"]
  spec.email         = ["brandon@anti-pattern.com"]
  spec.summary       = %q{Disable ActiveRecord callbacks}
  spec.description   = %q{Raises an exception if an ActiveRecord callback is used. Won't interfere with usage from within other gems.}
  spec.homepage      = "https://github.com/brandonweiss/hold_please"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*.rb"] + Dir["test/**/*.rb"]
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "activerecord", ">= 3"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "sqlite3"
  spec.add_development_dependency "mocha"
end
