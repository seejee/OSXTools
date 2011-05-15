require 'bundler'
require 'rspec/core/rake_task'

Bundler::GemHelper.install_tasks

task default: :spec

RSpec::Core::RakeTask.new(:spec)

RSpec::Core::RakeTask.new(:unit) do |t|
  t.rspec_opts = '--tag ~type:integration'
end

RSpec::Core::RakeTask.new(:integration) do |t|
  t.rspec_opts = '--tag type:integration'
end

