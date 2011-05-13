require_relative 'osx_tools/version'
require_relative 'osx_tools/diskutil_invoker'
require_relative 'osx_tools/hdiutil_invoker'
require_relative 'osx_tools/volume'

module OSXTools
  extend self

  def attached_volumes(invoker = DiskutilInvoker.new)
    volume_ids = invoker.list["AllDisks"]
    volume_ids.inject([]) {|volumes, id| volumes << Volume.new(id, invoker)}
  end

  def mount_image(path_to_image, invoker = HdiutilInvoker.new)
    invoker.mount_image(path_to_image)
  end

end

