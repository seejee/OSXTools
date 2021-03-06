require 'Plist'

module OSXTools
  class DiskutilInvoker

    def list
      query('list')
    end

    def info(id)
      query('info', id)
    end

    def eject(id)
      command('eject', id)
    end

    def mount(id)
      command('mount', id)
    end

    def unmount(id)
      command('unmount', id)
    end

    private

    def query(verb, id=nil)
      args = build_query_args(verb, id)
      plist_xml = get_plist(args)
      Plist.parse_xml(plist_xml)
    end

    def get_plist(args)
      command_line = args.join(' ')
      plist_xml = `#{command_line}`
      plist_xml
    end

    def build_query_args(verb, id=nil)
      args = []
      args << 'diskutil'
      args << verb
      args << '-plist'
      args << id unless id.nil?
      args
    end

    def command(command, id)
      `diskutil #{command} #{id}`
    end

  end
end