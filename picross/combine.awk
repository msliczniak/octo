#!/usr/bin/awk -f

BEGIN {
	FS = "."
	cmd = "/usr/bin/fmt -1"

	while ( ( cmd ) | getline ) {
		a = $1

		if ( ( cmd ) | getline ) b = $1
		else b = 0

		c = 0; #printf("%2d %2d ", a, b)
		for (i = 0; i < 4; i++) {
			c *= 2
			if (a % 1) c++
			a /= 2

			c *= 2
			if (b % 1) c++
			b /= 2
		}

		print c
	}

	exit
} 
