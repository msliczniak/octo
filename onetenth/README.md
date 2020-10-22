in inspector add attribude:

style="position:absolute; top:50px;"

to add implicit sources:

$ make onetenth.deps && git add `./ideps.sh onetenth | sed 's/$/4/'`

rebuild everything with breakpoints:

$ make MPFLAGS=-D_DEBUG clean onetenth.ch8 cb && ls -l onetenth.ch8
