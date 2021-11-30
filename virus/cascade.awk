#!/usr/bin/awk -f
BEGIN { a[4] = "B" }

NF != 4 { exit(1) }

{
	a[0] = $1
	a[1] = $2
	a[2] = $3
	a[3] = $4

	for (i = 0; i < 4; i++) {
		if (a[i] != "B") continue

		if (a[i + 1] == "F") continue

		a[i] = a[i + 1]
		a[i + 1] = "B"
	}

	print a[0], a[1], a[2], a[3]
}

# % printf '%s\n' {0..2}{0..2}{0..2}{0..2} | tr '012' 'BCF' | \
#   sed 's/./& /g' >cascade.txt
