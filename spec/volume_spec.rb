require 'spec_helper'

describe Volume do

  before(:each) do
    @invoker = mock "diskutil_invoker"
  end

  context "when inspecting a volume" do

    before(:each) do
      @volume = Volume.new('disk0', @invoker)
    end

    it "should expose the volume's id" do
      @volume.id.should == 'disk0'
    end

    it 'should retrieve node via the diskutil invoker' do
      @invoker.should_receive(:info).with('disk0').and_return({"DeviceNode" => '/dev/disk0s1'})

      @volume.node.should == '/dev/disk0s1'
    end

    it 'should retrieve bootable via the diskutil invoker' do
      @invoker.should_receive(:info).with('disk0').and_return({"Bootable" => true})

      @volume.bootable?.should == true
    end

    it 'should retrieve name via the diskutil invoker' do
      @invoker.should_receive(:info).with('disk0').and_return({"VolumeName" => 'name'})

      @volume.name.should == 'name'
    end

    it 'should retrieve filesystem via the diskutil invoker' do
      @invoker.should_receive(:info).with('disk0').and_return({"FilesystemUserVisibleName" => 'filesystem'})

      @volume.filesystem.should == 'filesystem'
    end

    it 'should retrieve total_size via the diskutil invoker' do
      @invoker.should_receive(:info).with('disk0').and_return({"TotalSize" => 1_000_000})

      @volume.total_size.should == 1_000_000
    end

    it 'should retrieve free_space via the diskutil invoker' do
      @invoker.should_receive(:info).with('disk0').and_return({"FreeSpace" => 500_000})

      @volume.free_space.should == 500_000
    end

    it 'should retrieve total_size via the diskutil invoker' do
      @invoker.should_receive(:info).with('disk0').and_return({"TotalSize" => 1_000_000})

      @volume.total_size.should == 1_000_000
    end

    it 'should calculate percent_used' do
      @invoker.should_receive(:info).with('disk0').and_return({"FreeSpace" => 500_000, "TotalSize" => 1_000_000})

      @volume.percent_used.should == 50.00
    end

    it 'should only call the invoker once' do
      @invoker.should_receive(:info).once.and_return({})

      @volume.bootable?
      @volume.node
    end
  end
end