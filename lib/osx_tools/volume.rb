module OSXTools
  class Volume

    def self.expose_info(method_name, key)
      define_method(method_name) do
         info_hash[key]
      end
    end

    attr_reader :id

    expose_info :node         ,"DeviceNode"
    expose_info :name         ,"VolumeName"
    expose_info :filesystem   ,"FilesystemUserVisibleName"
    expose_info :bus_protocol ,"BusProtocol"
    expose_info :total_size   ,"TotalSize"
    expose_info :free_space   ,"FreeSpace"
    expose_info :bootable?    ,"Bootable"
    expose_info :mount_point  ,"MountPoint"

    def initialize(id, invoker)
      @id         = id
      @diskutil   = invoker
    end

    def percent_used
      free_space.fdiv(total_size) * 100.0
    end

    def mounted?
      mount_point.empty? == false
    end

    def eject
      @diskutil.eject(@id)
    end

    def mount
      @diskutil.mount(@id)
    end

    def unmount
      @diskutil.unmount(@id)
    end

    private

    def info_hash
      @info_hash ||= @diskutil.info(@id)
    end

  end
end