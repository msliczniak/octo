LANG = C

NAME = montage

TGTS = ${NAME}.txt ${NAME}.png ${NAME}.gif

all : ${TGTS}

PBMS =  0-spi.pbm 1-0b.pbm 2-1r.pbm 3-2i.pbm 4-4b.pbm 5-8r.pbm 6-16i.pbm \
        7-32b.pbm 8-64r.pbm 9-128i.pbm a-256b.pbm b-512r.pbm c-1ki.pbm \
        d-2kb.pbm e-4kr.pbm f-8ki.pbm g-16kb.pbm h-32kr.pbm i-64ki.pbm \
        j-128kr.pbm

GIFS =  0-spi.gif 1-0b.gif 2-1r.gif 3-2i.gif 4-4b.gif 5-8r.gif 6-16i.gif \
        7-32b.gif 8-64r.gif 9-128i.gif a-256b.gif b-512r.gif c-1ki.gif \
        d-2kb.gif e-4kr.gif f-8ki.gif g-16kb.gif h-32kr.gif i-64ki.gif \
        j-128kr.gif

PNGS =  0-spi.png 1-0b.png 2-1r.png 3-2i.png 4-4b.png 5-8r.png 6-16i.png \
        7-32b.png 8-64r.png 9-128i.png a-256b.png b-512r.png c-1ki.png \
        d-2kb.png e-4kr.png f-8ki.png g-16kb.png h-32kr.png i-64ki.png \
        j-128kr.png

TXTS =  0-spi.txt 1-0b.txt 2-1r.txt 3-2i.txt 4-4b.txt 5-8r.txt 6-16i.txt \
        7-32b.txt 8-64r.txt 9-128i.txt a-256b.txt b-512r.txt c-1ki.txt \
        d-2kb.txt e-4kr.txt f-8ki.txt g-16kb.txt h-32kr.txt i-64ki.txt \
        j-128kr.txt

SRCS =  ${PBMS}
OBJS =  ${PNGS} ${GIFS} ${TXTS}

CONVERT = ./convert.awk
FONT =    ./font.sh
CAT =     /bin/cat
RM =      /bin/rm -f

# GNU make stupidity
.SECONDARY :
.SUFFIXES :
% : %.txt
% : %.gif
% : %.pbm
% : %.png

.SUFFIXES : .gif .pbm .png .txt

.PHONY : all clean force

.DELETE_ON_ERROR :

force :

${OBJS} : Makefile

${PNGS} : ${GIFS}

${TXTS} : ${FONT}

${NAME}.txt : ${TXTS}
	$(CAT) $(TXTS) >$@

.gif.png :
	convert $< -crop 16x1 -gravity North -background black \
	  -splice 0x1 -append $@

.gif.txt :
	$(FONT) $< >$@

${NAME}.png : ${GIFS}
	montage $(GIFS) -geometry +0+0 -tile 4x $@

${NAME}.gif : ${PNGS}
	montage $(PNGS) -geometry +0+0 -tile 4x gif:- | \
	gifsicle -wk2 '-t#ffffff' >$@

.pbm.gif :
	$(CONVERT) $< >$@

clean :
	$(RM) $(TGTS) $(OBJS)
