#!/bin/sh

# generate cascade jump table

./cascade.sed cascade.txt | paste res.txt - | awk '
$1 == $2 {
	print "jump _casi    #", $2
	next
}

{
	print "jump _cas" $1 " #", $2
}'
