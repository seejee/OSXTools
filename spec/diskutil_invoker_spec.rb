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

  context "when executing the list command" do

    it 'should call: diskutil list -plist' do
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

  context "when executing the info command" do

    it 'should call: diskutil info -plist {id}' do
      IO.should_receive(:popen).with(['diskutil', 'info', '-plist', 'id'])

      @invoker.info('id')
    end

  end

  context "when executing the eject command" do

    it 'should call: diskutil eject {id}' do
      @invoker.should_receive(:system).with(['diskutil', 'eject', 'id'])

      @invoker.eject('id')
    end

  end
end