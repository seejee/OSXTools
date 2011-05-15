require 'spec_helper'

describe OSXTools do

  before(:each) do
    invoker = get_invoker_with_injected_plist('list.plist')
    @volumes = OSXTools.attached_volumes(invoker)
  end

  context "when retrieving a list of volumes" do

    it 'should create 5 volume records' do
      @volumes.length.should == 5
    end

    it 'should contain disk0' do
      @volumes.first.id.should == 'disk0'
    end

    it 'should contain disk1s1' do
      @volumes.last.id.should == 'disk1s1'
    end

  end

end
