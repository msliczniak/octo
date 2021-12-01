#!/usr/bin/awk -f
BEGIN { a[4] = "B" }

NF != 4 { exit(1) }

{
	a[0] = $1
	a[1] = $2
	a[2] = $3
	a[3] = $4

	for (i = 0; i < 3; i++) {
		if (a[i] !~ /^B/) continue

		if (a[i + 1] ~ /^F/) continue

		b = a[i]
		a[i] = a[i + 1]
		a[i + 1] = b
	}

	print a[0], a[1], a[2], a[3]
}

# FF and FC behave the same
# % printf '%s\n' {x..z}0{x..z}1{x..z}2{x..z}3 | tr 'xyz' 'BCF' | \
#   sed 's/../& /g; s/ $//' | grep -v 'F0 C1' | grep -v 'F2 C3' >cascade.txt
# % ./cascade.awk cascade.txt >one.txt
# % ./cascade.awk one.txt >two.txt
