require 'spec_helper'

describe Volume do

  before(:each) do
    @invoker = mock "diskutil_invoker"
    @volume = Volume.new('disk0', @invoker)
  end

  context "when ejecting a volume" do

    it 'should call eject on the diskutil invoker' do
      @invoker.should_receive(:eject).with('disk0')

      @volume.eject
    end

  end

  context "when unmounting a volume" do

    it 'should call unmount on the diskutil invoker' do
      @invoker.should_receive(:unmount).with('disk0')

      @volume.unmount
    end

  end

  context "when mounting a volume" do

    it 'should call mount on the diskutil invoker' do
      @invoker.should_receive(:mount).with('disk0')

      @volume.mount
    end

  end

  context "when inspecting a volume" do

    before(:each) do
      inject_plist('info.plist')

      @invoker = DiskutilInvoker.new
      @volume = Volume.new('disk0s2', @invoker)
    end

    it "should expose the volume's id" do
      @volume.id.should == 'disk0s2'
    end

    it 'should retrieve node via the diskutil invoker' do
      @volume.node.should == '/dev/disk0s2'
    end

    it 'should retrieve bootable via the diskutil invoker' do
      @volume.bootable?.should == true
    end

    it 'should retrieve name via the diskutil invoker' do
      @volume.name.should == 'Hackintosh'
    end

    it 'should retrieve filesystem via the diskutil invoker' do
      @volume.filesystem.should == 'Mac OS Extended (Journaled)'
    end

    it 'should retrieve bus_protocol via the diskutil invoker' do
      @volume.bus_protocol.should == 'SATA'
    end

    it 'should retrieve total_size via the diskutil invoker' do
      @volume.total_size.should == 499_763_888_128
    end

    it 'should retrieve free_space via the diskutil invoker' do
      @volume.free_space.should == 473_183_952_896
    end

    it 'should calculate percent_used' do
      @volume.percent_used.should == 94.6815014322939
    end

    it 'should only call the invoker once for info' do
      @invoker.should_receive(:info).once.and_return({})

      @volume.bootable?
      @volume.node
    end
  end
end