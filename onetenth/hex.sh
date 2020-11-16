#!/bin/sh
# create Intel hex file
printf ':01%04X00%02X%02X\n' `xxd -c1 -ps "$1" | awk 'BEGIN {
	print "define(I, 0x300)dnl"
	print "include(hex.m4)dnl"
}
{
	print "M(0x" $1 ")"
}' | m4`
echo ':00000001FF'
