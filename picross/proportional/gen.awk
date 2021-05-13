#!/usr/bin/awk -f

# $ identify -ping -format '%w %f\n' f-??.gif | sort -rn | head -1
# 8 f-40.gif
# $ convert f-05.gif f-04.gif +append -format '%w 05 04\n' info:
# 7 05 04

# $ ./gen.awk | sort -rn | head -1
# 16 f-02.gif f-02.gif f-02.gif f-02.gif f-01.gif f-01.gif

#  ./gen.awk syms=7 max=20 | sort -rn | head -1
# 21 f-02.gif f-02.gif f-02.gif f-02.gif f-02.gif f-02.gif f-02.gif

# $ time ./gen.awk syms=6 max=30 | awk '$1 > max { max = $1; line = $0 }
# END { print line }'
# 24 f-04.gif f-04.gif f-04.gif f-04.gif f-04.gif f-04.gif
# real	76m57.437s
# user	28m7.882s
# sys	28m37.443s

# $ time ./gen.awk syms=7 max=40 | awk '$1 > max { max = $1; line = $0; print line }'
# 7 40
# 8 f-40.gif
# 10 f-38.gif f-01.gif
# 11 f-37.gif f-02.gif
# 12 f-36.gif f-01.gif f-01.gif
# 13 f-34.gif f-03.gif f-01.gif
# 14 f-34.gif f-02.gif f-02.gif
# 15 f-32.gif f-02.gif f-02.gif f-01.gif
# 16 f-30.gif f-04.gif f-04.gif
# 17 f-30.gif f-04.gif f-02.gif f-01.gif
# 18 f-30.gif f-02.gif f-02.gif f-01.gif f-01.gif
# 19 f-29.gif f-02.gif f-02.gif f-02.gif f-01.gif
# 20 f-28.gif f-02.gif f-02.gif f-02.gif f-02.gif
# 21 f-27.gif f-02.gif f-02.gif f-02.gif f-01.gif f-01.gif
# 22 f-26.gif f-02.gif f-02.gif f-02.gif f-02.gif f-01.gif
# 23 f-24.gif f-04.gif f-02.gif f-02.gif f-02.gif f-01.gif
# 24 f-24.gif f-02.gif f-02.gif f-02.gif f-02.gif f-01.gif f-01.gif
# 25 f-22.gif f-02.gif f-02.gif f-02.gif f-02.gif f-02.gif f-02.gif
# 26 f-20.gif f-04.gif f-04.gif f-02.gif f-02.gif f-01.gif f-01.gif
# 27 f-20.gif f-04.gif f-02.gif f-02.gif f-02.gif f-02.gif f-02.gif
# 28 f-14.gif f-04.gif f-04.gif f-04.gif f-04.gif f-02.gif f-02.gif
# 29 f-10.gif f-10.gif f-04.gif f-04.gif f-02.gif f-02.gif f-02.gif
# 30 f-10.gif f-04.gif f-04.gif f-04.gif f-04.gif f-04.gif f-04.gif
# user	818m4.772s
# sys	812m26.928s

BEGIN {
	for (max = ARGC++; max > 0; max--) ARGV[max] = ARGV[max - 1]
	ARGV[1] = "/dev/null"
	syms = 6
	max = 15
}

{ exit }

function f(sym, val, files,    i, c) {
	if ((sym-- == 0) || (val <= 0)) {
		c = "convert" files " +append -format '%w" files "\\n' info:"
		i = system(c)
		if (i == 0) return

		print " -1"
		print "9999", i
		exit (i)
	}

	for (i = val; i > 0; i--)
		f(sym, val - i - 1, sprintf("%s f-%02d.gif", files, i))
}

END {
	print syms, max; f(syms, max, "")
}
