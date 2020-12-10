LANG = C

NAME = montage

TGTS = ${NAME}.txt ${NAME}.png

all : ${TGTS}

PBMS =  0-sp.pbm 1-0.pbm 2-1.pbm 3-2.pbm 4-4.pbm 5-8.pbm 6-16.pbm 7-32.pbm \
        8-64.pbm 9-128.pbm a-256.pbm b-512.pbm c-1k.pbm d-2k.pbm e-4k.pbm \
        f-8k.pbm g-16k.pbm h-32k.pbm i-64k.pbm j-128k.pbm

GIFS =  0-sp.gif 1-0.gif 2-1.gif 3-2.gif 4-4.gif 5-8.gif 6-16.gif 7-32.gif \
        8-64.gif 9-128.gif a-256.gif b-512.gif c-1k.gif d-2k.gif e-4k.gif \
        f-8k.gif g-16k.gif h-32k.gif i-64k.gif j-128k.gif

TXTS =  0-sp.txt 1-0.txt 2-1.txt 3-2.txt 4-4.txt 5-8.txt 6-16.txt 7-32.txt \
        8-64.txt 9-128.txt a-256.txt b-512.txt c-1k.txt d-2k.txt e-4k.txt \
        f-8k.txt g-16k.txt h-32k.txt i-64k.txt j-128k.txt

# GNU make stupidity
.SECONDARY :
.SUFFIXES :
% : %.png
% : %.txt
% : %.gif
% : %.pbm

.SUFFIXES : .txt .gif .pbm

.PHONY : all clean force

.DELETE_ON_ERROR :

force :

${GIFS} : Makefile

${TXTS} : Makefile ./font.sh

${NAME}.txt : ${TXTS}
	cat ${TXTS} >$@

.gif.txt :
	./font.sh $< >$@

${NAME}.png : ${GIFS}
	montage $(GIFS) -geometry +0+0 -tile 4x $@

.pbm.gif :
	convert -size 15x7 xc:white $< -flop \
	  -gravity center -composite \
	  -flop \
	  -gravity northwest -background black -extent 16x8 \
	  -negate -strip $@

clean :
	$(RM) $(TGTS) $(GIFS)
