require 'bundler/setup'

require 'osx_volume_manager'

RSpec.configure do |c|
  include OsxVolumeManager
end

