module OsxTools
  class Volume

    attr_reader :id, :is_ejected, :is_mounted

    def initialize(id, invoker)
      @id = id
      @diskutil = invoker
      @is_mounted = true
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

    def bus_protocol
      info_hash["BusProtocol"]
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

    def mount
      @diskutil.mount(@id)
      @is_mounted = true
    end

    def unmount
      @diskutil.unmount(@id)
      @is_mounted = false
    end

    private

    def info_hash
      @info_hash ||= @diskutil.info(@id)
    end
  end
end