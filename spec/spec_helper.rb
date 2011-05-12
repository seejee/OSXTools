require 'bundler/setup'
require 'rspec'
require 'osx_tools'

RSpec.configure do |c|
  include OSXTools
end

