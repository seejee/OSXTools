require 'spec_helper'
require 'Plist'

describe DiskutilInvoker do

  before(:each) do

    example_plist = %Q{
    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
      <dict>
        <key>key</key>
        <string>val</string>
      </dict>
    </plist>
    }

    @io = StringIO.new(example_plist)
    IO.stub!(:popen).and_return(@io)

    @invoker = DiskutilInvoker.new
  end

  context "when executing the list command" do

    it 'should call: diskutil list -plist' do
      IO.should_receive(:popen).with(['diskutil', 'list', '-plist'])

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

  context "when executing the unmount command" do

    it 'should call: diskutil unmount {id}' do
      @invoker.should_receive(:system).with(['diskutil', 'unmount', 'id'])

      @invoker.unmount('id')
    end

  end

  context "when executing the mount command" do

    it 'should call: diskutil mount {id}' do
      @invoker.should_receive(:system).with(['diskutil', 'mount', 'id'])

      @invoker.mount('id')
    end

  end
end