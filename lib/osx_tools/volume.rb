module OsxTools
  class Volume

    attr_reader :id, :is_ejected

    def initialize(id, invoker)
      @id = id
      @diskutil = invoker
    end

    def node
      info_hash["DeviceNode"]
    end

    def name
      info_hash["VolumeName"]
    end

    def filesystem
      info_hash["FilesystemUserVisibleName"]
    end

    def total_size
      info_hash["TotalSize"]
    end

    def free_space
      info_hash["FreeSpace"]
    end

    def percent_used
      free_space.fdiv(total_size) * 100.0
    end

    def bootable?
      info_hash["Bootable"]
    end

    def eject
      @diskutil.eject(@id)
      @is_ejected = true
    end

    private

    def info_hash
      @info_hash ||= @diskutil.info(@id)
    end
  end
end