#!/bin/sh
# convert to 3-color PGM

convert "$1" +dither -colorspace RGB -flatten -colorspace Gray \
  -normalize -colors 3 -strip -compress None ppm:- | \
awk 'NR == 2 { # dimensions
	print "P2"
	print
	print 2
}

NR < 4 { next }

{
	i = 2
	for (;;) {
		j = $(i - 1) " " $i " " $(i + 1)
		if (j == "0 0 0") printf("0")
		else if (j == "255 255 255") printf("2")
		else printf("1")

		i += 3
		if (i > NF) break

		printf(" ")
	}

	print ""
}'
