require 'Plist'

module OsxTools
  class DiskutilInvoker
    def list
      get_hash_from_command('list')
    end

    private

    def get_hash_from_command(command)
      plist_xml = get_plist_from_command(command)
      Plist::parse_xml(plist_xml)
    end

    def get_plist_from_command(command)
      output = IO.popen(['diskutil', command, '-plist'])
      lines = output.readlines
      output.close
      lines.join(' ')
    end
  end
end