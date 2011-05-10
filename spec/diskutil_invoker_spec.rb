require 'spec_helper'
require 'Plist'

describe DiskutilInvoker do
  before(:each) do
    @mock_io = mock "io"
    @mock_io.stub!(:close)
    @mock_io.stub!(:readlines).and_return(['a'])

    @invoker = DiskutilInvoker.new
  end

  context "when executing a command" do

    it 'should invoke the command line' do
      IO.should_receive(:popen).with(['diskutil', 'list', '-plist']).and_return(@mock_io)

      plist_content = ['plist', 'xml']
      @mock_io.should_receive(:readlines).and_return(plist_content)

      Plist.should_receive(:parse_xml).with('plist xml').and_return({"key" => ['val1', 'val2']})

      @invoker.list
     end
  end
end