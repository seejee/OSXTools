require 'Plist'

module OsxTools
  class VolumeManager

    def volumes
      output = IO.popen(['diskutil', 'list', '-plist'])
      lines = output.readlines
      output.close

      hash = Plist::parse_xml(lines.join(' '))
      hash["AllDisks"]
    end
  end

end