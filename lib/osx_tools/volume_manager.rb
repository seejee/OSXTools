module OsxTools
  class VolumeManager

    def volumes
      IO.popen(['diskutil', 'list'])
      
    end
  end

end