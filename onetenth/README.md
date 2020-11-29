# onetenth

[demo](https://msliczniak.github.io/octo/onetenth/onetenth.htm)

in inspector add attribude:

style="position:absolute; top:50px; right:250px;"

to add implicit sources:

$ make onetenth.deps && git add `./ideps.sh onetenth | sed 's/$/4/'`

rebuild everything with breakpoints:

$ make MPFLAGS=-D_DEBUG clean \
  test300.hex onetenth-eti.ch8 onetenth.hex cb && \
  ls -l onetenth.ch8 | awk '{ print 2960 - $(NF - 4); exit }'

record screen:

open and then position in the lower right corner of screen 0
$ open black.png

$ system_profiler SPDisplaysDataType | grep -iw resolution:
          Resolution: 1440 x 900 (Widescreen eXtended Graphics Array Plus)

Start program in Emma 02 so it is the front window.

Enable Access for assistive devices to run this script:
enable.png

$ open -a applescript\ editor

> tell application "System Events" to tell process "Emma 02" to set the position of the front window to {990, 556}

Which device is screen 0:

$ ffmpeg -hide_banner -f avfoundation -list_devices true -i '' 2>&1 | awk '$NF == 0 && tolower($(NF-1)) == "screen" && tolower($(NF-2)) == "capture" { print $(NF-3) }'
[1]

$ ffmpeg -pix_fmt bgr0 -r 60 -hide_banner -f avfoundation -i 1:0 -vf 'crop=384:256:1056:644' -y -an -sn -map_metadata -1 out.m4v
