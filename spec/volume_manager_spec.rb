require 'spec_helper'

describe VolumeManager do

  before(:all) do
    @manager = VolumeManager.new
  end

  context "when retrieving a list of volumes" do

    it 'should invoke diskutil list' do
      IO.should_receive(:popen).with(['diskutil', 'list'])
      @manager.volumes
    end
  end
end
