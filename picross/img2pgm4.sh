#!/bin/sh

# convert to 2-bit PGM

# produce two PGMs
#  1. 4x1 greyscale colormap
#  2. image
convert "$1" +dither -depth 8 -colorspace RGB -flatten -colorspace Gray \
  -normalize -colors 4 -strip \( +clone -unique-colors \) +swap  \
  -compress None pgm:- | \
awk 'NR == 4 { # greyscale colormap
	j = 0
	for (i = 1; i <= NF; i++) {
		if ($i == 0) a[i] = 0
		else if ($i == 255) a[i] = 3
		else m[j++] = i
	}

	# order greys
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
	
	for (i = 1; i <= NF; i++) m[$i] = a[i]
	split("", a)

	#for (i in m) print i, m[i]

	next
}

NR == 6 { # dimensions
	print "P2"
	print
	print 3

	next
}

NR < 8 { next }

{
	#print

	i = 1
	for (;;) {
		printf("%s", m[$i])

		if (i == NF) break

		i++
		printf(" ")
	}

	print ""
}'
