require 'spec_helper'
require 'Plist'

describe DiskutilInvoker do

  before(:each) do
    @io = StringIO.new('')
    IO.stub!(:popen).and_return(@io)

    @invoker = DiskutilInvoker.new
  end

   context "when executing the eject command" do

    it 'should call: diskutil eject {id}' do
      @invoker.should_receive(:system).with('diskutil', 'eject', 'id')

      @invoker.eject('id')
    end

  end

  context "when executing the unmount command" do

    it 'should call: diskutil unmount {id}' do
      @invoker.should_receive(:system).with('diskutil', 'unmount', 'id')

      @invoker.unmount('id')
    end

  end

  context "when executing the mount command" do

    it 'should call: diskutil mount {id}' do
      @invoker.should_receive(:system).with('diskutil', 'mount', 'id')

      @invoker.mount('id')
    end

  end
end