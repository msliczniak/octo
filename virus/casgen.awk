#!/usr/bin/awk -f

# generate cascade.txt in jump table order

# q  ^  0
# r  |  1
# s  |  2
# t  |  3
#
# D  st qr st - qr st qr  0
# Cr Cq Cr Cq - Tr Tq Tr Tq
# Ct Cs Ct Cs - Tt Ts Tt Ts
#
# % printf '%s\n' {x..z}{x..z} | tr 'xyz' 'FPB' | nl -v-1
#     -1	FF
#      0	FP
#      1	FB
#      2	PF
#      3	PP
#      4	PB
#      5	BF
#      6	BP
#      7	BB
#  % printf '%02x\n' 0 4 16 20 64 68 80 84 | xxd -r -p | xxd -b -c1
# 00000000: 00000000  .
# 00000001: 00000100  .
# 00000002: 00010000  .
# 00000003: 00010100  .
# 00000004: 01000000  @
# 00000005: 01000100  D
# 00000006: 01010000  P
# 00000007: 01010100  T

BEGIN {
	a["000"] = "f0 f1"
	a["001"] = "f0 b1"
	a["010"] = "p0 f1"
	a["011"] = "p0 p1"
	a["100"] = "p0 b1"
	a["101"] = "b0 f1"
	a["110"] = "b0 p1"
	a["111"] = "b0 b1"

	b["000"] = "f2 f3"
	b["001"] = "f2 b3"
	b["010"] = "p2 f3"
	b["011"] = "p2 p3"
	b["100"] = "p2 b3"
	b["101"] = "b2 f3"
	b["110"] = "b2 p3"
	b["111"] = "b2 b3"

	for (b1 = 0; b1 < 2; b1++)
	for (b2 = 0; b2 < 2; b2++)
	for (b3 = 0; b3 < 2; b3++)
	for (b4 = 0; b4 < 2; b4++)
	for (b5 = 0; b5 < 2; b5++)
	for (b6 = 0; b6 < 2; b6++)
		print a[b2 b4 b6], b[b1 b3 b5]

	exit
}
