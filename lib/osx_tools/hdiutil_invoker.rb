module OSXTools
  class HdiutilInvoker

    def mount_image(path_to_image)
      succeeded = system('hdiutil', 'attach', path_to_image)
      raise "Error mounting disk image" unless succeeded
    end

  end
end