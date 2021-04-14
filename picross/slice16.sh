#!/bin/sh

# convert shroom0.pbm shroom1.pbm -compose Difference -composite -negate \
# -compress None -strip shroomx.pbm
# ./slice16.sh shroom0.pbm -stroke black
# ./slice16.sh shroomx.pbm -stroke white
# for i in shroom0-s?.pbm shroomx-s?.pbm; do echo ': '`basename $i .pbm`; \
# awk 'NR < 3 { next } { print "0b" $1 $2 $3 $4 $5 $6 $7 $8 \
# " 0b" $9 $10 $11 $12 $13 $14 $15 $16 }' $i; echo; done

n=`basename "$1" .pbm` || exit
shift 1

convert "$n".pbm -sample 45x45 pbm:- | \
convert -size 48x45 xc:white pbm:- -geometry +2+0 -composite \
  $* -strokewidth 1 -draw 'line 47,0 47,44' -compress None -strip pbm:- | \
convert pbm:- -crop 16x16 -compress None -strip pbm:- | \
awk '/P1/ { close(f); f = sprintf("%s-s%d.pbm", n, i++) } { print >f }
	END { if (i != 18) exit(1) }' n="$n"
