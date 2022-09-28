#!/usr/bin/awk -f

BEGIN {
	s = "\n: board_02\n"
}

NF == 8 {
	c0 = "0b"
	c1 = "0b"
	t0 = "0b"
	t1 = "0b"

	for (i = 1; i <= NF; i++) {
		t = substr($i, 1, 1)
		if (t == "V") {
			t0 = t0 "0"
			t1 = t1 "1"
		} else if (t == "R") {
			t0 = t0 "1"
			t1 = t1 "0"
		} else if (t == "L") {
			t0 = t0 "1"
			t1 = t1 "1"
		} else {
			t0 = t0 "0"
			t1 = t1 "0"
			c0 = c0 "0"
			c1 = c1 "0"

			continue
		}

		t = substr($i, 2, 1)
		if (t == "B") {
			c0 = c0 "0"
			c1 = c1 "1"
		} else if (t == "Y") {
			c0 = c0 "1"
			c1 = c1 "0"
		} else {
			c0 = c0 "1"
			c1 = c1 "1"
		}
	}
	
	print c0, c1 s t0, t1
	s = " "
	next
}

{ print }
