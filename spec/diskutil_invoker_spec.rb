require 'spec_helper'
require 'Plist'

describe DiskutilInvoker do
  before(:each) do
    @mock_io = mock "io"
    @mock_io.stub!(:close)
    @mock_io.stub!(:readlines).and_return(['a', 'b'])

    IO.stub!(:popen).and_return(@mock_io)
    Plist.stub!(:parse_xml).and_return({"key" => "val"})

    @invoker = DiskutilInvoker.new
  end

  context "when executing a command" do

    it 'should invoke the command line' do
      IO.should_receive(:popen).with(['diskutil', 'list', '-plist'])

      @invoker.list
    end

    it 'should join the plist lines output by diskutil' do
      Plist.should_receive(:parse_xml).with('a b')

      @invoker.list
    end

    it 'should return the parsed plist hash' do
      @invoker.list.should == {"key" => "val"}
     end
  end
end