LANG = C

NAME = montage

#TGTS = ${NAME}.txt ${NAME}.png ${NAME}.gif mockupeti.GIF
TGTS = ${NAME}.gif mockup.png mockupbw.png mockup.gif

all : ${TGTS}

PBM0 = 0-spi.pbm 1-2s.pbm 2-4s.pbm 3-2r.pbm
PBM1 = 4-4b.pbm 5-8r.pbm 6-16i.pbm 7-32b.pbm
PBM2 = 8-64r.pbm 9-128i.pbm a-256b.pbm b-512r.pbm
PBM3 = c-1ki.pbm d-2kb.pbm e-4kr.pbm f-8ki.pbm
PBM4 = g-16kb.pbm h-32kr.pbm i-64ki.pbm j-128kr.pbm
PBMS = ${PBM0} ${PBM1} ${{PBM2} ${PBM3} ${PBM4}

SRCS =  ${PBMS}
#OBJS =  ${PNGS} ${GIFS} ${TXTS}

CONVERT = ../convert.awk
FONT =    ../font.sh
CAT =     /bin/cat
RM =      /bin/rm -f

# GNU make stupidity
.SECONDARY :
.SUFFIXES :
#% : %.txt
% : %.gif
% : %.pbm
#% : %.png

#.SUFFIXES : .gif .pbm .png .txt
.SUFFIXES : .gif .pbm

.PHONY : all clean force

.DELETE_ON_ERROR :

force :

${OBJS} ${TGTS} : Makefile

#${PNGS} : ${GIFS}

#${TXTS} : ${FONT}

#${NAME}.txt : ${TXTS}
#	$(CAT) $(TXTS) >$@

#mockupeti.GIF : mockupeti.png
#	convert mockupeti.png -sample '256x192!' mockupeti.GIF

#.gif.png :
#	convert $< -crop 16x1 -gravity North -background black \
#	  -splice 0x1 -append $@

#.gif.txt :
#	$(FONT) $< >$@

#${NAME}.png : ${GIFS}
#	montage $(GIFS) -geometry +0+0 -tile 4x $@

${NAME}.gif : ${PBMS}
	convert $(PBM0) +repage -splice 0x1 -gravity South -chop 0x1 \
	  -gravity North $(PBM1) $(PBM2) $(PBM3) $(PBM4) +repage \
	  +append -splice 0x1 -crop 64x11 -append \
	  -crop 64x54+0+1 +repage -gravity South -chop 0x1 -negate gif:- | \
	gifsicle -wk2 '-t#ffffff' >$@

mockup.png : ${NAME}.gif back.png
	composite -gravity South $(NAME).gif back.png mockup.png

mockupbw.png : ${NAME}.gif back.png
	convert back.png -threshold 0 +dither -monochrome ${NAME}.gif \
	  -gravity South -composite mockupbw.png

mockup.gif : mockup.png
	convert mockup.png -fill black -draw 'line 32,0 32,5' \
	  mockup.png +swap gif:- | \
	gifsicle -O3 -d20 '#0' -d80 '#1' -l0 >mockup.gif

admins-Air:eti aga$ open -a safari mockup.gif
#.pbm.gif :
#	$(CONVERT) $< >$@

clean :
	$(RM) $(TGTS) $(OBJS)
