require 'spec_helper'

describe OSXTools do

  before(:each) do
    inject_plist('list.plist')
  end

  context "when retrieving a list of volumes" do

    it 'should create 5 volume records' do
      OSXTools.volumes.length.should == 5
    end

    it 'should contain disk0' do
      OSXTools.volumes.first.id.should == 'disk0'
    end

    it 'should contain disk1s1' do
      OSXTools.volumes.last.id.should == 'disk1s1'
    end

  end
end
