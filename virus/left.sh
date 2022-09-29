#!/bin/sh
# hex-off dec-len bits
jot -w '%02x' 256 0 | xxd -r -ps | xxd -b -c1 | awk -v L=-1 '$2"1" !~ /11/ {
	printf("%s %02d %s\n", $1, NR - L, $2)
	L = NR
}

END { printf(": %02d .\n", 255 - L) }'
