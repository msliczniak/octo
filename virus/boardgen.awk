#!/usr/bin/awk -f

NF == 8 {
	c = "0b"
	t0 = "0b"
	t1 = "0b"

	for (i = 1; i <= NF; i++) {
		if (i == 5) {
			ca = c
			c = "0b"
		}

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
			c = c "00"

			continue
		}

		t = substr($i, 2, 1)
		if (t == "B") c = c "01"
		else if (t == "Y") c = c "10"
		else c = c "11"
	}
	
	print ca, c, t0, t1
	next
}

{ print }
