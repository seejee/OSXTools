module OsxTools
  class Volume

    attr_reader :id

    def initialize(id, invoker)
      @id = id
      @diskutil = invoker
    end

    def node
      info_hash["DeviceNode"]
    end

    def bootable?
      info_hash["Bootable"]
    end

    private

    def info_hash
      @info_hash ||= @diskutil.info(@id)
    end
  end
end