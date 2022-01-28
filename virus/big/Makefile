SRCS = r.pbm y.pbm b.pbm tile.pbm
OBJS = bg.pbm \
       hrr.pbm hyy.pbm hbb.pbm hry.pbm hrb.pbm hyb.pbm \
       vrr.pbm vyy.pbm vbb.pbm vry.pbm vrb.pbm vyb.pbm \
       bg.pbm

.PHONY : all clean

all : ${OBJS}

${OBJS} : ${SRCS} Makefile

bg.pbm : tile.pbm
	convert -size 30x30 tile:tile.pbm -compress None bg.pbm

H = +append -gravity Center -chop 1x0 \
    -gravity NorthWest -background White -splice 1x0 \
    bg.pbm -reverse -geometry +18+12 -composite -geometry +0+0 \
    bg.pbm -reverse -compose Difference -composite -negate \
    -compress None -strip

hrr.pbm : r.pbm
	convert $< +duplicate $H $@

hyy.pbm : y.pbm
	convert $< +duplicate $H $@

hbb.pbm : b.pbm
	convert $< +duplicate $H $@

hry.pbm : r.pbm y.pbm
	convert r.pbm y.pbm $H $@

hrb.pbm : r.pbm b.pbm
	convert r.pbm b.pbm $H $@

hyb.pbm : y.pbm b.pbm
	convert y.pbm b.pbm $H $@

V = -append -gravity Center -chop 0x1 \
    -gravity NorthWest -background White -splice 0x1 \
    bg.pbm -reverse -geometry +18+12 -composite -geometry +0+0 \
    bg.pbm -reverse -compose Difference -composite -negate \
    -compress None -strip

vrr.pbm : r.pbm
	convert $< +duplicate $V $@

vyy.pbm : y.pbm
	convert $< +duplicate $V $@

vbb.pbm : b.pbm
	convert $< +duplicate $V $@

vry.pbm : r.pbm y.pbm
	convert r.pbm y.pbm $V $@

vrb.pbm : r.pbm b.pbm
	convert r.pbm b.pbm $V $@

vyb.pbm : y.pbm b.pbm
	convert y.pbm b.pbm $V $@

clean :
	$(RM) ${OBJS}
