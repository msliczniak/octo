LANG = C

NAME = onetenth

all : ${NAME}.8o

ID = ./ideps.sh         # list implicit dependencies
AS = ../Octo/octo       # assembler
CB = /usr/bin/pbcopy    # cut buffer
RM = /bin/rm -f

# GNU make stupidity
.SUFFIXES :
% : %.ch8
% : %.8o
% : %.m
% : %.deps

.SUFFIXES : .ch8 .8o .m .deps

.PHONY : cb all clean force ${NAME}.m

.DELETE_ON_ERROR :

cb : ${NAME}.8o
	$(CB) <${NAME}.8o

clean :
	$(RM) \
	    `$(ID) $(NAME)` \
	  $(NAME).8o $(NAME).ch8 $(NAME).m $(NAME).deps $(NAME).txt 

force :

.8o.ch8 :
	$(AS) $(AFLAGS) $< $@

.m.8o :
	$(MAKE) $(MFLAGS) -f Makefile.deps $@

${NAME}.m : ${NAME}.deps force
	$(MAKE) $(MFLAGS) -f Makefile.deps -f - ${NAME}.deps $@ <${NAME}.deps

${NAME}.deps :
	$(MAKE) $(MFLAGS) -f Makefile.deps $@
