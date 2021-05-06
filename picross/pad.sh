#!/bin/sh

sed -n '/^#/n; s/./& /gp; $i\
0 0 0 0 0 0 0
' | fmt -15 | awk 'NF != 8 { exit } 1'
