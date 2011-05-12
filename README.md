# OSX Disk Volume Manager

This gem provides a mechanism to manipulate OSX dis volumes via Ruby. It contains the following features:

* List attached volumes
* View metadata about each volume
* Mount/Unmount/Eject volumes

## Example

The following code finds the first USB flash drive and ejects it.

    usb_drive = OsxTools.volumes.find {|v| v.bus_protocol == 'USB'}
    usb_drive.eject

## Technical notes

* VolumeManager works by wrapping the OSX command line utility, diskutil.
* Diskutil provides an option to output its queries in plist format, so the Plist gem is used to parse output into a hash.
* The Volume class acts as a thin layer over diskutil's plist hash.
* VolumeManager and Volume use the DiskutilInvoker class to interact with the command line via system() and popen().