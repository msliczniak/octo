#!/usr/bin/env -Smawk -f
#!/usr/bin/awk -f

BEGIN {
	# r[0] = "00000000" ... r[255] = "11111111"
	k = 15; r[0] = "00"; r[1] = "01"; r[2] = "10"; r[3] = "11"
	for (i = 3; i >= 0; i--) for (j = 3; j >= 0; j--) r[k--] = r[i] r[j]
	k = 255; #for (i = 0; i < 16; i++) printf("%2d '%s'\n", i, r[i]); exit
	for (i = 15; i >= 0; i--) for (j = 15; j >= 0; j--) r[k--] = r[i] r[j]
	#for (i = 0; i < 256; i++) printf("%3d '%s'\n", i, r[i]); exit
	FS = "#"
}

NR == 1 {
	if ((k <= 0) || (k > 8)) exit(1)

	m = ""; j = 128 / k; for (i = 0; i < j; m = m "1") q[i++] = m "0"
	#for (i = 0; i < j; i++) printf("%3d '%s'\n", i, q[i]); exit

	m = 9 - k; for (i = 0; i < 256; i++) r[i] = substr(r[i], m)
	#for (i = 0; i < 256; i++) printf("%3d '%s'\n", i, r[i]); exit

	m = k*2
}

{
	printf("#	%s", $1)
	for (i = 2 + 0; i <= NF; i++) {
		printf("#%s", $i)
	}
	print ""

	if (NF == 0) next
}

{
	n = split($1, a, " ")
	for (i = 1 + 0; i <= n; i++) {
		j = int(a[i])
		printf("%s%s", q[int(j/m)], r[j])
	}
	print ""
}
