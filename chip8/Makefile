LANG = C

RAM = c8x-2p2k.ram c8x-2p3k.ram c8x-2p4k.ram c8-2p2k.ram c8-2p3k.ram c8-2p4k.ram

all : ${RAM}

RM = /bin/rm -f

# GNU make stupidity
.SECONDARY :
.SUFFIXES :
% : %.ram

.SUFFIXES : .ram .txt

.PHONY : all clean

.DELETE_ON_ERROR :

c8x-2p2k.ram : c8x-2p.txt c8-2p2k.txt
	./patch.sh 2k

c8x-2p3k.ram : c8x-2p.txt c8-2p3k.txt
	./patch.sh 3k

c8x-2p4k.ram : c8x-2p.txt c8-2p4k.txt
	./patch.sh 4k

.txt.ram :
	xxd -r -c1 $< >$@

clean :
	$(RM) $(RAM)
