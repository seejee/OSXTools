require 'spec_helper'

describe Volume do

  before(:each) do
    @invoker  = mock "invoker"
    @volume   = Volume.new('disk0', @invoker)
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
      @invoker = get_invoker_with_injected_plist('info.plist')
      @volume = Volume.new('disk0s2', @invoker)
    end

    it "should expose the volume's id" do
      @volume.id.should == 'disk0s2'
    end

    it 'should expose node' do
      @volume.node.should == '/dev/disk0s2'
    end

    it 'should expose bootable' do
      @volume.bootable?.should == true
    end

    it 'should expose name' do
      @volume.name.should == 'Hackintosh'
    end

    it 'should expose filesystem' do
      @volume.filesystem.should == 'Mac OS Extended (Journaled)'
    end

    it 'should expose bus_protocol' do
      @volume.bus_protocol.should == 'SATA'
    end

    it 'should expose total_size' do
      @volume.total_size.should == 499_763_888_128
    end

    it 'should expose free_space' do
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