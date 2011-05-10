module OsxTools
  class VolumeManager

    def initialize(invoker = DiskutilInvoker.new)
      @diskutil = invoker
    end

    def volumes
      hash = @diskutil.list
      hash["AllDisks"]
    end
  end
end