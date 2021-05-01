#!/usr/bin/awk -f

NR == 1 { if ($1 != "P1") exit(1); next }

NR == 2 {
	if ($1 < 14) {
		c = "convert -size 15x7 xc:white pbm:- "
		c = c "-gravity South -composite -gravity North -size 15x8 "
		c = c "\\( +clone xc:white +swap -composite -negate \\) "
		c = c "+swap -gravity South xc:white -composite "
		c = c "-size 15x9 xc:white +swap -gravity North -composite "
		c = c "-gravity East -background black -splice 1x0"
	} else {
		c = "convert -size 16x9 xc:white pbm:- -negate "
		c = c "-gravity West -composite"
	}

	c = c " -strip gif:-"
	#print c; exit

	print "P1" | ( c )
}

{ print | ( c ) }
