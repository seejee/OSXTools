require 'spec_helper'

describe VolumeManager do

  before(:each) do
    @invoker = mock "diskutil_invoker"
    @manager = VolumeManager.new(@invoker)
  end

  context "when retrieving a list of volumes" do

    it 'should call the DiskUtilInvokers list method' do
      @invoker.should_receive(:list).and_return({})

      @manager.volumes
     end

    it 'should return array in the key called AllDisks' do
      @invoker.stub!(:list).and_return({"AllDisks" => ['disk0', 'disk1', 'disk2']})

      @manager.volumes.length.should == 3
      @manager.volumes.first.should == 'disk0'
    end
  end
end
