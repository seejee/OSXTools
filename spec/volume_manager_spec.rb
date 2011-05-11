require 'spec_helper'

describe VolumeManager do

  before(:each) do
    @invoker = mock "diskutil_invoker"
  end

  context "when retrieving a list of volumes" do

    before(:each) do
      @manager = VolumeManager.new(@invoker)
    end

    it 'should call the DiskUtilInvokers list method' do
      @invoker.should_receive(:list).and_return({"AllDisks" => []})

      @manager.volumes
     end

    it 'should create volume records from the the key in the hash called AllDisks' do
      @invoker.stub!(:list).and_return({"AllDisks" => ['disk0', 'disk1', 'disk2']})

      @manager.volumes.length.should == 3
      @manager.volumes.first.id.should == 'disk0'
      @manager.volumes.last.id.should == 'disk2'
    end
  end


end
