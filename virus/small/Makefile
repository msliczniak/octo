.PHONY : all clean

.SUFFIXES: # remove defaults
.SUFFIXES: .h.ew.pbm .v.ew.pbm .h.ns.pbm .v.ns.pbm .h.pbm .v.pbm .pbm

PBMS = rr.pbm yy.pbm bb.pbm ry.pbm rb.pbm yb.pbm
 
PBMS_H = ${PBMS:.pbm=.h.pbm}
PBMS_V = ${PBMS:.pbm=.v.pbm}

PBMS_EW_H = ${PBMS_H:.v.pbm=.h.ew.pbm}
PBMS_NS_H = ${PBMS_H:.v.pbm=.h.ns.pbm}

PBMS_EW_V = ${PBMS_V:.v.pbm=.v.ew.pbm}
PBMS_NS_V = ${PBMS_V:.v.pbm=.v.ns.pbm}

SRCS = Makefile ${PBMS_V} #${PBMS_H}
OBJS = ${PBMS_EW_V} ${PBMS_NS_V}

all : ${OBJS}

${OBJS} : ${SRCS}

O = -compress None -strip

.v.pbm.v.ew.pbm:
	convert -size 4x11 tile:$< -gravity East -splice 4x0 $O $@

.v.pbm.v.ns.pbm:
	convert -size 8x5 tile:$< $O $@

clean :
	$(RM) ${OBJS}
