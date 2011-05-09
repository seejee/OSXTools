require '../lib/osx_volume_manager'
require 'rspec'

describe 'osx volume' do

  it 'should new one up' do
    OSXVolumeManager::OSXVolume.new
  end

end
