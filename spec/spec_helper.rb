require 'bundler/setup'
require 'rspec'
require 'osx_tools'

RSpec.configure do |c|
  include OSXTools
end

module OSXTools

  def spec_resource_path
    File.dirname(__FILE__) + '/resources/'
  end

  def inject_plist(filename)
    info_plist_file = spec_resource_path + filename
    io = File.open(info_plist_file)
    IO.stub!(:popen).and_return(io)
  end



end

