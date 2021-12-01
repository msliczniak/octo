#!/usr/bin/awk -f

# generate lookup table A: bottle to cascade

# y
# x

BEGIN {
	for (b0 = 0; b0 < 2; b0++)
	for (b1 = 0; b1 < 2; b1++)
	for (b2 = 0; b2 < 2; b2++)
	for (b3 = 0; b3 < 2; b3++)
	for (b4 = 0; b4 < 2; b4++)
	for (b5 = 0; b5 < 2; b5++)
	for (b6 = 0; b6 < 2; b6++)
	for (b7 = 0; b7 < 2; b7++) {
		c = b0 b2
		t = b4 b6
		if (c == "00") x = "B"
		else if (t == "00") x = "P"
		else x = "F"

		c = b1 b3
		t = b5 b7
		if (c == "00") y = "B"
		else if (t == "00") y = "P"
		else y = "F"

		print x y
	}

	exit
}
