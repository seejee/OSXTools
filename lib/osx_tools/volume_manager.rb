module OsxTools
  class VolumeManager

    def initialize(invoker)
      @diskutil = invoker || DiskutilInvoker.new
    end

    def volumes
      hash = @diskutil.list
      hash["AllDisks"]
    end
  end
end