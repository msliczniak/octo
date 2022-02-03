#!/bin/sh

# drop

case "$1" in
  r[bry].[hv].dr.pbm)
	a=r
	;;
  y[bry].[hv].dr.pbm)
	a=y
	;;
  b[bry].[hv].dr.pbm)
	a=b
	;;
  *)
	echo 'dr.sh: bad file:' "$1" >&2
	exit 1
	;;
esac

case "$1" in
  ?r.[hv].dr.pbm)
	b=r
	;;
  ?y.[hv].dr.pbm)
	b=y
	;;
  ?b.[hv].dr.pbm)
	b=b
	;;
esac

o='-compress None -strip'

case "$1" in
  ??.h.dr.pbm)
	convert -size 4x5 tile:$b.pbm $a.pbm -reverse -append $o "$1"
	;;
  ??.v.dr.pbm)
	d=v
	;;
esac
