module OsxTools
  class VolumeManager

    def initialize(invoker = DiskutilInvoker.new)
      @diskutil = invoker
    end

    def volumes
      volume_ids = @diskutil.list["AllDisks"]
      volume_ids.inject([]) {|volumes, id| volumes << Volume.new(id, @diskutil)}
    end
  end
end