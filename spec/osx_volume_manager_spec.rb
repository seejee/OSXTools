require '../lib/osx_volume_manager'
require 'rspec'

describe 'osx volume' do

  it 'should new one up' do
    @thing = OSXVolumeManager::OSXVolume.new
    @thing.goo

  end

end
