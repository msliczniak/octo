#!/usr/bin/awk -f

# take a PGM and create left and right bit planes
# f looks like j-128kr.txt

NR == 1 {
	print "dnl", f >f
	getline; getline; getline
}

{
	l = r = 0
	for (i = 1; i < 9; i++) {
		l *= 2
		r *= 2
		if ($i == 3 || $i == 2) l++
		if ($i == 3 || $i == 1) r++
	}

	i = NR - 4
	printf("pushdef(`LA%d', %d)pushdef(`RA%d', %d)", i, l, i, r) >f

	l = r = 0
	for (i = 9; i < 17; i++) {
		l *= 2
		r *= 2
		if ($i == 3 || $i == 2) l++
		if ($i == 3 || $i == 1) r++
	}

	i = NR - 4
	printf("pushdef(`LB%d', %d)dnl\npushdef(`RB%d', %d)", i, l, i, r) >f

	l = r = 0
	for (i = 17; i < 25; i++) {
		l *= 2
		r *= 2
		if ($i == 3 || $i == 2) l++
		if ($i == 3 || $i == 1) r++
	}

	i = NR - 4
	printf("pushdef(`LC%d', %d)pushdef(`RC%d', %d)dnl\n", i, l, i, r) >f
}

END { print "NI" >f }
