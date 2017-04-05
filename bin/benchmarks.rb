# frozen_string_literal: true
require_relative '../lib/case'
require 'benchmark/ips'

c = Case.new

Benchmark.ips do |x|
  x.config(time: 5, warmup: 5)
  x.report("Rust camelCase") { c.to_camel_case("rust_string") }
  x.report("Ruby camelCase") { c.ruby_to_camel_case("rust_string") }
  x.compare!
end

Benchmark.ips do |x|
  x.config(time: 5, warmup: 5)
  x.report("Rust snake_case") { c.to_snake_case("rustString")}
  x.report("Ruby snake_case") { c.ruby_to_snake_case("rustString")}
  x.compare!
end

Benchmark.ips do |x|
  x.config(time: 5, warmup: 5)
  x.report("Rust PascalCase") { c.to_pascal_case("rust_string")}
  x.report("Ruby PascalCase") { c.ruby_to_pascal_case("rust_string")}
  x.compare!
end
