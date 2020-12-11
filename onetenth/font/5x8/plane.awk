#!/usr/bin/awk -f

# take a PGM and create left and right bit planes
# f looks like j-128kr.txt

NR == 1 {
	print "dnl", f >f
	getline; getline; getline
	if ($1 == 0)      print "C(P00)dnl" >f
	else if ($1 == 1) print "C(P01)dnl" >f
	else if ($1 == 2) print "C(P10)dnl" >f
	else              print "C(P11)dnl" >f
}

{
	l = r = 0
	for (i = 1; i < 9; i++) {
		l *= 2
		r *= 2
		if ($i == 3 || $i == 2) l++
		if ($i == 3 || $i == 1) r++
	}

	printf("L(%d)R(%d)dnl\n", l, r) >f
}

NR == 18 { print "" >f; exit }
