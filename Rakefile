require "bundler/gem_tasks"
require "rspec/core/rake_task"
require 'thermite/tasks'

thermite = Thermite::Tasks.new
RSpec::Core::RakeTask.new(:spec)

task default: %w(thermite:build)

desc 'Run Rust & Ruby testsuites'
task test: %w(thermite:build thermite:test)
