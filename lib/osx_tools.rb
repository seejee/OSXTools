require_relative 'osx_tools/version'
require_relative 'osx_tools/diskutil_invoker'
require_relative 'osx_tools/volume'

module OSXTools
  extend self

  def volumes(invoker = DiskutilInvoker.new)
    volume_ids = invoker.list["AllDisks"]
    volume_ids.inject([]) {|volumes, id| volumes << Volume.new(id, invoker)}
  end

end

