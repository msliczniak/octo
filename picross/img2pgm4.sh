#!/bin/sh

# convert to 2-bit PGM

# produce three PPMs
#  1. 4x1 greyscale
#  2. 4x1 RGB corresponding to previous brightnesses
#  3. image
convert "$1" +dither -depth 8 -colorspace RGB -flatten -colors 4 -strip \
  \( +clone -unique-colors \) \( +clone -colorspace Gray \) -swap -3,-1 \
  -compress None ppm:- | \
awk 'NR == 4 { # greyscale
	j = 0
	for (i = 2; i < NF; i += 3) {
		if ($i == 0) a[i] = 0
		else if ($i == 255) a[i] = 3
		else m[j++] = i
	}

	i = m[0]; j = m[1]
	split("", m)
	if (i < j) {
		a[i] = 1
		a[j] = 2
	} else {
		a[i] = 2
		a[j] = 1
	}

	#for (i in a) print i, a[i]

	next
}

NR == 8 { # RGB
	for (i = 2; i < NF; i += 3) {
		j = $(i - 1) " " $i " " $(i + 1)
		m[j] = a[i]
	}

	split("", a)
	next
}

NR == 10 { # dimensions
	print "P2"
	print
	print 3

	next
}

NR < 12 { next }

{
	i = 2
	for (;;) {
		j = $(i - 1) " " $i " " $(i + 1)
		printf("%s", m[j])

		i += 3
		if (i > NF) break

		printf(" ")
	}

	print ""
}'
