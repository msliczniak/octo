in inspector add attribude:

style="position:absolute; top:50px; right:200px;"

to add implicit sources:

$ make onetenth.deps && git add `./ideps.sh onetenth | sed 's/$/4/'`

rebuild everything with breakpoints:

$ make MPFLAGS=-D_DEBUG clean \
  test300.hex onetenth-eti.ch8 onetenth.hex cb && \
  ls -l onetenth.ch8 | awk '{ print 2960 - $(NF - 4); exit }'
