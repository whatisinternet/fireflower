# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fireflower/version'

Gem::Specification.new do |spec|
  spec.name          = "fireflower"
  spec.version       = Fireflower::VERSION
  spec.authors       = ["Whatisinternet"]
  spec.email         = ["joshteeter@gmail.com"]

  spec.summary       = %q{A sample gem for demonstrating mixing Rust with Ruby}
  spec.description   = %q{Created for KWRuby this gem is for a presentation on using Rust and Ruby to create a gem}
  spec.homepage      = ""
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Thermite specific see https://github.com/malept/thermite#usage
  spec.extensions << 'ext/Rakefile'
  spec.add_runtime_dependency 'thermite', '~> 0'

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
