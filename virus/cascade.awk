#!/usr/bin/awk -f
NF != 4 { exit(1) }

{
	a[0] = $1
	a[1] = $2
	a[2] = $3
	a[3] = $4

	for (i = 0; i < 3; i++) {
		if (a[i] !~ /^b/) continue

		if (a[i + 1] ~ /^f/) continue

		b = a[i]
		a[i] = a[i + 1]
		a[i + 1] = b
	}

	print a[0], a[1], a[2], a[3]
}

# FF and FP behave the same
# % ./casgen.awk >cascade.txt
# % ./cascade.awk cascade.txt >one.txt
# % ./cascade.awk one.txt >two.txt
