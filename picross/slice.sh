#!/bin/sh

# convert shroom0.pbm shroom1.pbm -compose Difference -composite \
# -compress None -strip shroomx.pbm
# ./slice.sh shroom0
# ./slice.sh shroomx
# for i in shroom?-*??.pbm; do echo ': '`basename $i .pbm`; \
# tail -15 "$i" | tr -d ' ' | sed 's/^/0b/'; echo; done

convert "$1".pbm -sample 45x45 pbm:- | \
convert -size 48x45 xc:white pbm:- -geometry +2+0 -composite \
  -draw 'line 47,0 47,44' -compress None -strip pbm:- | \
convert pbm:- -crop 8x15 -compress None -strip pbm:- | \
awk '/P1/ { close(f); f = sprintf("%s-%02d.pbm", n, i++) } { print >f }
	END { if (i != 18) exit(1) }' n="$1"
