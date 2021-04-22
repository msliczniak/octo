#!/usr/bin/awk -f

BEGIN {
	f = "A%x.B%x.C%x.D%x-E%x.F%x.G%x.H%x"
	s = "J%x.K%x.L%x.M%x-P%x.T%x.V%x.X%x"
	for (i = 0; i < 15; i++) {
       		a[i*2] = sprintf(f, i, i, i, i, i, i, i, i)
		a[i*2 + 1] = sprintf(s, i, i, i, i, i, i, i, i)
	}

	for (i = 30; i < 512; i++) a[i] = "_S._S._S._S-_S._S._S._S"

	f = "  %s"
	for (i = 0; i < 32; i++) {
		if ((i % 8) == 0) print ""
		printf("%03x", i)
		printf(f, a[i++])
		printf(f, a[i])
		printf("  %03x\n", i)
	}

	f = "%s.%s.%s.%s-_s._s._s._s"
	s = "%s.%s.%s._z-%s.%s.%s._z"
	z = "_z._z._z._z-_z._z._z._z"
}

$1 ~ /^#/ { next }

NF == 0 { print }

NF > 2 {
	if ($1 ~ /^#/) next

	p = ("0x" $1) + 0; b = a[p]

	print $1, $2, ("0x" $2) - p

	p = 0
	for (i = 2; i <= NF; i++) {
		p += "0x" $i
		split(b, v, /[\.-]/)
		j = v[1]; k = v[2]
		m = sprintf(s, j, j, j, k, k, k)
		j = v[3]; k = v[4]
		n = sprintf(s, j, j, j, k, k, k)
		a[p++] = m; a[p++] = n
		a[p++] = m; a[p++] = n
		a[p++] = m; a[p] = n
		#a[++p] = z; a[++p] = z
		b = sprintf(f, v[5], v[6], v[7], v[8])
	}
}

END {
	f = "  %s"
	for (i = 0; i < 512; i++) {
		if ((i % 32) == 0) print ""
		printf("%03x", i)
		printf(f, a[i++])
		printf(f, a[i])
		printf("  %03x\n", i)
	}
}
