#!/usr/bin/awk -f

# 4-bit unescaped RLE

# didn't grow much
# $ ./rle.awk lady[01].pbm shroom[01].pbm wolf[01].pbm | wc | \
#   awk '{ print $1 + int($2 / 2 + .5), 30 * $1 }'
# 221 180

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
		sym = 1 # gray is light on screen not ink to paper
		j = 0
		for (i = 1; i <= n; i++) {
			#print ":" a[i]

			# imagemagick pads rawbits
			if ((i % 16) == 0) continue

			if (a[i] == sym) {
				if (j == 15) {
					printf(" 15.%s", sym)
					j = 0

					continue
				}

				j++
				continue
			}

			printf(" %2d.%s", j, sym)
			sym = a[i]
			j = 1
		}

		if (j != 0) printf(" %2d.%s", j, sym)
		print ""
	}

	exit(0)
}
