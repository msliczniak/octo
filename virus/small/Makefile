.PHONY : all clean

.SUFFIXES: # remove defaults
.SUFFIXES: .h.se.pbm .v.se.pbm .h.sw.pbm .v.sw.pbm .h.ew.pbm .v.ew.pbm \
           .h.ns.pbm .v.ns.pbm .h.pbm .v.pbm .pbm

PBMS = rr.pbm yy.pbm bb.pbm ry.pbm rb.pbm yb.pbm yr.pbm br.pbm by.pbm
 
PBMS_H = ${PBMS:.pbm=.h.pbm}
PBMS_V = ${PBMS:.pbm=.v.pbm}

PBMS_EW_H = ${PBMS_H:.h.pbm=.h.ew.pbm}
PBMS_NS_H = ${PBMS_H:.h.pbm=.h.ns.pbm}
PBMS_SE_H = ${PBMS_H:.h.pbm=.h.se.pbm}

PBMS_EW_V = ${PBMS_V:.v.pbm=.v.ew.pbm}
PBMS_NS_V = ${PBMS_V:.v.pbm=.v.ns.pbm}

SRCS = ${PBMS_H} ${PBMS_V} Makefile
OBJS = ${PBMS_EW_H} ${PBMS_NS_H} ${PBMS_SE_H} \
       ${PBMS_EW_V} ${PBMS_NS_V}

all : ${OBJS}

${OBJS} : ${SRCS}

O = -compress None -strip

H = -negate -compose Difference -composite -negate -gravity East -splice 4x0

.h.pbm.h.ew.pbm:
	convert $< -splice 0x6 $< $H $O $@

.h.pbm.h.ns.pbm:
	convert -size 8x9 tile:$< $O $@

.h.pbm.h.se.pbm:
	convert $< -splice 0x6 $< +append $O $@

.v.pbm.v.ew.pbm:
	convert -size 4x11 tile:$< -gravity East -splice 4x0 $O $@

.v.pbm.v.ns.pbm:
	convert -size 8x5 tile:$< $O $@

clean :
	$(RM) ${OBJS}
