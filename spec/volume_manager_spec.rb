require 'spec_helper'
require 'Plist'

class MockIO
  def readlines
  end

  def close
  end
end

describe VolumeManager do

  before(:each) do
    @mock_io = mock "io"
    @mock_io.stub!(:close)
    @mock_io.stub!(:readlines).and_return(['a'])

    @manager = VolumeManager.new
  end

  context "when retrieving a list of volumes" do

    it 'should invoke diskutil list' do
      IO.should_receive(:popen).with(['diskutil', 'list', '-plist']).and_return(@mock_io)

      plist_content = ['plist', 'xml']
      @mock_io.should_receive(:readlines).and_return(plist_content)

      Plist.should_receive(:parse_xml).with('plist xml').and_return({"AllDisks" => ['disk0', 'disk1', 'disk2']})

      @manager.volumes
     end

    it 'should parse the stream output' do
      IO.should_receive(:popen).and_return(@mock_io)

      plist_content = ['plist', 'xml']
      @mock_io.should_receive(:readlines).and_return(plist_content)

      Plist.should_receive(:parse_xml).with('plist xml').and_return({"AllDisks" => ['disk0', 'disk1', 'disk2']})

      @manager.volumes
    end

    it 'should return the disks contained in the AllDisks key' do
      IO.should_receive(:popen).and_return(@mock_io)

      plist_content = ['plist', 'xml']
      @mock_io.should_receive(:readlines).and_return(plist_content)

      Plist.should_receive(:parse_xml).with('plist xml').and_return({"AllDisks" => ['disk0', 'disk1', 'disk2']})

      @manager.volumes.length.should == 3
    end
  end
end
