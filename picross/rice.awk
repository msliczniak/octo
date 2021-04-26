#!/usr/bin/awk -f
BEGIN {
	# r[0] = "0 0 0 0 0 0 0 0 " ... r[255] = "1 1 1 1 1 1 1 1 "
	k = 15; r[0] = "0 0 "; r[1] = "0 1 "; r[2] = "1 0 "; r[3] = "1 1 "
	for (i = 3; i >= 0; i--) for (j = 3; j >= 0; j--) r[k--] = r[i] r[j]
	k = 255; #for (i = 0; i < 16; i++) printf("%2d '%s'\n", i, r[i]); exit
	for (i = 15; i >= 0; i--) for (j = 15; j >= 0; j--) r[k--] = r[i] r[j]
	#for (i = 0; i < 256; i++) printf("%3d '%s'\n", i, r[i]); exit
}

NR == 1 {
	if ((k <= 0) || (k > 8)) exit(1)

	m = ""; j = 128 / k; for (i = 0; i < j; m = m "1 ") q[i++] = m "0 "
	#for (i = 0; i < j; i++) printf("%3d '%s'\n", i, q[i]); exit

	m = 17 - k*2; for (i = 0; i < 256; i++) r[i] = substr(r[i], m)
	#for (i = 0; i < 256; i++) printf("%3d '%s'\n", i, r[i]); exit

	m = k*2
}

{
	for (i = 1; i <= NF; i++) printf("%s%s", q[int(int($i)/m)], r[int($i)])
	print ""
}

END { print "0 0 0 0 0 0 0" }
