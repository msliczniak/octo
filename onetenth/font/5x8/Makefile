LANG = C

NAME = montage

TGTS = ${NAME}.txt ${NAME}.png ${NAME}-r.txt ${NAME}-r.png

all : ${TGTS}

PBMS =  0-spi.pbm 1-0b.pbm 2-1r.pbm 3-2i.pbm 4-4b.pbm 5-8r.pbm 6-16i.pbm \
        7-32b.pbm 8-64r.pbm 9-128i.pbm a-256b.pbm b-512r.pbm c-1ki.pbm \
        d-2kb.pbm e-4kr.pbm f-8ki.pbm g-16kb.pbm h-32kr.pbm i-64ki.pbm \
        j-128kr.pbm

PGMS =  0-spi.pgm 1-0b.pgm 2-1r.pgm 3-2i.pgm 4-4b.pgm 5-8r.pgm 6-16i.pgm \
        7-32b.pgm 8-64r.pgm 9-128i.pgm a-256b.pgm b-512r.pgm c-1ki.pgm \
        d-2kb.pgm e-4kr.pgm f-8ki.pgm g-16kb.pgm h-32kr.pgm i-64ki.pgm \
        j-128kr.pgm

GIFS =  0-spi.gif 1-0b.gif 2-1r.gif 3-2i.gif 4-4b.gif 5-8r.gif 6-16i.gif \
        7-32b.gif 8-64r.gif 9-128i.gif a-256b.gif b-512r.gif c-1ki.gif \
        d-2kb.gif e-4kr.gif f-8ki.gif g-16kb.gif h-32kr.gif i-64ki.gif \
        j-128kr.gif

TXTS =  0-spi.txt 1-0b.txt 2-1r.txt 3-2i.txt 4-4b.txt 5-8r.txt 6-16i.txt \
        7-32b.txt 8-64r.txt 9-128i.txt a-256b.txt b-512r.txt c-1ki.txt \
        d-2kb.txt e-4kr.txt f-8ki.txt g-16kb.txt h-32kr.txt i-64ki.txt \
        j-128kr.txt

RTXTS = 0-spi-r.txt 1-0b-r.txt 2-1r-r.txt 3-2i-r.txt 4-4b-r.txt \
        5-8r-r.txt 6-16i-r.txt 7-32b-r.txt 8-64r-r.txt 9-128i-r.txt \
        a-256b-r.txt b-512r-r.txt c-1ki-r.txt d-2kb-r.txt e-4kr-r.txt \
        f-8ki-r.txt g-16kb-r.txt h-32kr-r.txt i-64ki-r.txt j-128kr-r.txt

SRCS =  ${PBMS}
OBJS =  ${PGMS} ${GIFS} ${TXTS} ${RTXTS}

FONT =  ./font.sh
PGM =   ./pgm.awk
PLANE = ./plane.awk
CAT =   /bin/cat
RM =    /bin/rm -f

# GNU make stupidity
.SECONDARY :
.SUFFIXES :
% : %-r.txt
% : %.txt
% : %.gif
% : %.pbm
% : %.pgm

.SUFFIXES : .gif .pbm .pgm -r.txt .txt

.PHONY : all clean force

.DELETE_ON_ERROR :

force :

${OBJS} : Makefile

${RTXTS} : ${PLANE}

${TXTS} : ${FONT}

${PGMS} : ${PGM}

${NAME}-r.txt : ${RTXTS}
	$(CAT) $(RTXTS) >$@

.pgm-r.txt :
	$(PLANE) f=$@ $<

${NAME}-r.png : ${PGMS}
	montage $(PGMS) -geometry +0+0 -tile 4x -rotate 270 $@

.gif.pgm :
	convert $< -crop 15x8+0+0 +repage -rotate 90 \
	  -strip -compress none pbm:- | ${PGM} f=$@

${NAME}.txt : ${TXTS}
	$(CAT) $(TXTS) >$@

.gif.txt :
	$(FONT) $< >$@

${NAME}.png : ${GIFS}
	montage $(GIFS) -geometry +0+0 -tile 4x $@

.pbm.gif :
	convert -size 15x7 xc:white $< -flop \
	  -gravity center -composite \
	  -flop \
	  -negate \
	  -gravity northwest -background black -extent 16x8 \
	  -negate -strip $@

clean :
	$(RM) $(TGTS) $(OBJS)
