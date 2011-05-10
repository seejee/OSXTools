require 'Plist'

module OsxTools
  class DiskutilInvoker
    def list
      invoke_and_parse('list')
    end

    private

    def invoke_and_parse(command)
      output = IO.popen(['diskutil', command, '-plist'])
      lines = output.readlines
      output.close

      plist_xml = lines.join(' ')
      Plist::parse_xml(plist_xml)
    end
  end
end