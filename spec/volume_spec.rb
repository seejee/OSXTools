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

    it 'should only call the invoker once' do
      @invoker.should_receive(:info).once.and_return({})

      @volume.bootable?
      @volume.node
    end
  end
end