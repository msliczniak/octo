#!/bin/sh

# create m4 template from GIF

convert "$1" -crop 16x5+0+1 -compress none pbm:- | \
  awk 'BEGIN { print "ibase=0000000002" } NR > 2 { print }' | \
  fmt -16 | tr -d ' ' | bc | awk 'BEGIN {
	print "dnl", "'"$1"'"
}

{
	printf("pushdef(`L%d'"'"', %s)", i, $1)
	getline
	printf("pushdef(`R%d'"'"', %s)dnl\n", i, $1)
	i++
}

END {
	print "NI"
	print ""
}'
