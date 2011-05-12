require 'spec_helper'

describe OsxTools do

  before(:each) do
    @invoker = mock "diskutil_invoker"
    @hash = {"AllDisks" => ['disk0', 'disk1', 'disk2']}
  end

  context "when retrieving a list of volumes" do

    it 'should call the DiskUtilInvokers list method' do
      @invoker.should_receive(:list).and_return(@hash)

      OsxTools.volumes(@invoker)
     end

    it 'should create volume records from the the hash key AllDisks' do
      @invoker.stub!(:list).and_return(@hash)

      volumes = OsxTools.volumes(@invoker)

      volumes.length.should == 3
      volumes.first.id.should == 'disk0'
      volumes.last.id.should == 'disk2'
    end
  end


end
