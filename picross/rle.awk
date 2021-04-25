#!/usr/bin/awk -f

# 4-bit unescaped RLE

BEGIN {
       	# imagemagick's 'gray' format is light on screen not ink to paper
	hi = 0
	lo = 1
}

# didn't grow much
# $ ./rle.awk lady[01].pbm shroom[01].pbm wolf[01].pbm | wc | \
#   awk '{ print $1 + int($2 / 2 + .5), 30 * $1 }'
# 221 180

# output 4-bits
function outn(c) {
	# remove bias
	if (sym == lo) {
		if (c % 2) c++
		else c--
	}

	printf(" %2d.%s", c, sym)
}

BEGIN {
	if (ARGC < 2) exit 1

	cmd = "convert"
	for (i = 1; i < ARGC; i++) {
		fn = ARGV[i]
		gsub(/'/, "'\''", fn)
		cmd = cmd " '" fn "'"
	}
	cmd = cmd " -depth 1 gray:- | xxd -c30 -g0 -b"
	#print cmd; exit

	while ( ( cmd ) | getline ) {
		#print $2

		n = split($2, a, "")
		sym = lo
		j = 0
		for (i = 1; i <= n; i++) {
			#print ":" a[i]

			# imagemagick pads rawbits
			if ((i % 16) == 0) continue

			if (a[i] == sym) {
				if (j == 15) {
					outn(j)
					j = 0

					continue
				}

				j++
				continue
			}

			outn(j)
			sym = a[i]
			j = 1
		}

		if (j != 0) outn(j)
		print ""
	}

	exit(0)
}
