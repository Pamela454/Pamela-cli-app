require "bundler/gem_tasks"
require "rspec/core/rake_task"
require "watirspec/rake_tasks"
WatirSpec::RakeTasks.new

RSpec::Core::RakeTask.new(:spec)

task :default => :spec
