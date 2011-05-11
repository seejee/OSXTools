require 'Plist'

module OsxTools
  class DiskutilInvoker
    def list
      args = build_args('list')
      get_hash(args)
    end

    def info(id)
      args = build_args('info', id)
      get_hash(args)
    end

    private

    def get_hash(args)
      plist_xml = get_plist(args)
      Plist.parse_xml(plist_xml)
    end

    def get_plist(args)
      output = IO.popen(args)
      lines = output.readlines
      output.close
      lines.join(' ')
    end

    def build_args(command, id=nil)
      args = []
      args << 'diskutil'
      args << command
      args << '-plist'
      args << id unless id.nil?
      args
    end
  end
end