$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'fireflower'
require 'case'
require 'rspec-benchmark'

RSpec.configure do |config|
    config.include RSpec::Benchmark::Matchers
end
