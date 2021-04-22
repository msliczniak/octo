#!/usr/bin/awk -f

BEGIN {
	z = "  %s"
	f = "A%x.B%x.C%x.D%x-E%x.F%x.G%x.H%x"
	s = "J%x.K%x.L%x.M%x-P%x.T%x.V%x.X%x"
	m = " *. *. *. *- *. *. *. *"
	n = " *. *. *. *- *. *. *. *"
	i = 0; k = 0
	for (;;) {
       		a[k] = m
		sub(/-/, "  ", m)
		printf("%03x", k++)
		printf(z, m)

		a[k] = n
		sub(/-/, "  ", n)
		printf(z, n)
		printf("  %03x\n", k++)

		if (k == 32) break
		if ((k % 8) == 0) print ""

		i++
		m = sprintf(f, i, i, i, i, i, i, i, i)
		n = sprintf(s, i, i, i, i, i, i, i, i)
	}

	for (; k < 512; k++) a[k] = "  .  .  .  -  .  .  .  "

	f = "%s.%s.%s.%s-  .  .  .  "
	s = "%s.%s.%s._z-%s.%s.%s. *"
	z = 0
}

$1 ~ /^#/ { next }

NF == 0 { print }

NF > 2 {
	if ($1 ~ /^#/) next

	p = ("0x" $1) + 0; b = a[p]; i = ("0x" $2) - p
	printf("%4d %3d < ", z - i, i); z = i
	print

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
