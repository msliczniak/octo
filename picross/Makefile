LANG = C

NAME = cb

all : grey.ch8 grey8x.c8x picross.ch8 picross8x.c8x # ${NAME}.8o

TOOLDIR = ../onetenth

ID = ${TOOLDIR}/ideps.sh         # list implicit dependencies
AS = ${TOOLDIR}/../Octo/octo       # assembler
CB = /usr/bin/pbcopy    # cut buffer
DD = ${TOOLDIR}/dd256.sh
RM = /bin/rm -f

# GNU make stupidity
.SECONDARY :
.SUFFIXES :
% : %-eti.ch8
% : %.hex
% : %.c8x
% : %.ch8
% : %.8o
% : %.m
% : %.m4
% : %.deps

.SUFFIXES : .hex -eti.ch8 .c8x .ch8 .8o .m .m4 .deps

.PHONY : cb all clean force # ${NAME}.m

.DELETE_ON_ERROR :

cb : ${NAME}.8o
	$(CB) <${NAME}.8o

clean :
	$(RM) grey.ch8 grey8x.ch8 picross.ch8 picross8x.ch8 \
	  grey8x.c8x picross8x.c8x

force :

.m.8o :
	$(MAKE) $(MFLAGS) -f Makefile.deps $@

.8o.ch8 :
	$(AS) $(AFLAGS) $< $@

.ch8.c8x :
	$(DD) 1 $< $@

.c8x.hex :
	$(TOOLDIR)/hex.sh $< >$@

.c8x-eti.ch8 :
	$(DD) 3 $< $@

test300.hex : test300.c8x

test300.c8x : test300.ch8

test300.ch8 : test300.8o

test300.8o : test300.m4
	m4 test300.m4 >$@

${NAME}.m : ${NAME}.deps force
	$(MAKE) $(MFLAGS) -f $(TOOLDIR)/Makefile.deps -f - ${NAME}.deps \
	  $@ <${NAME}.deps

.m4.m :
	$(MAKE) $(MFLAGS) -f $(TOOLDIR)/Makefile.deps $@

${NAME}.deps :
	$(MAKE) $(MFLAGS) -f $(TOOLDIR)/Makefile.deps $@
