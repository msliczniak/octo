PBMS =  0-sp.pbm 1-0.pbm 2-1.pbm 3-2.pbm 4-4.pbm 5-8.pbm 6-16.pbm 7-32.pbm \
        8-64.pbm 9-128.pbm a-256.pbm b-512.pbm c-1k.pbm d-2k.pbm e-4k.pbm \
        f-8k.pbm g-16k.pbm h-32k.pbm i-64k.pbm j-128k.pbm

GIFS =  0-sp.gif 1-0.gif 2-1.gif 3-2.gif 4-4.gif 5-8.gif 6-16.gif 7-32.gif \
        8-64.gif 9-128.gif a-256.gif b-512.gif c-1k.gif d-2k.gif e-4k.gif \
        f-8k.gif g-16k.gif h-32k.gif i-64k.gif j-128k.gif

# GNU make stupidity
.SECONDARY :
.SUFFIXES :
% : %.png
% : %.gif
% : %.pbm

.SUFFIXES : .gif .pbm

montage.png : $(GIFS) Makefile
	montage ${GIFS} -geometry +1+1 -tile 4x montage.png

.pbm.gif :
	convert -size 15x7 xc:white $< -geometry +0+0 -gravity center -strip \
	  -composite -negate $@
