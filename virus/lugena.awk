#!/usr/bin/awk -f

# generate lookup table A: bottle to cascade

# q  ^  0
# r  |  1
# s  |  2
# t  |  3
#
# D  st qr st - qr st qr  0
# Cr Cq Cr Cq - Tr Tq Tr Tq
# Ct Cs Ct Cs - Tt Ts Tt Ts

BEGIN {
	i = -1
	for (b0 = 0; b0 < 2; b0++)
	for (b1 = 0; b1 < 2; b1++)
	for (b2 = 0; b2 < 2; b2++)
	for (b3 = 0; b3 < 2; b3++)
	for (b4 = 0; b4 < 2; b4++)
	for (b5 = 0; b5 < 2; b5++)
	for (b6 = 0; b6 < 2; b6++)
	for (b7 = 0; b7 < 2; b7++) {
		i++

		c = b1 b3       # color
		k = b5 b7       # kind
		if (c == "00") 
			if (k == "00") q = "B"
			else continue
		else if (k == "00") q = "P"
		else if (c != "00") q = "F"
		else continue

		c = b0 b2       # color
		k = b4 b6       # kind
		if (c == "00") 
			if (k == "00") r = "B"
			else continue
		else if (k == "00") r = "P"
		else if (c != "00") r = "F"
		else continue

		printf(":org eval(LUT + %d) :byte %s%s\n", i, q, r)
	}

	exit
}
