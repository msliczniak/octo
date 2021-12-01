#!/usr/bin/sed -f
s/p0/0/;
s/p1/1/;
s/p2/2/;
s/p3/3/;
s/f0/0/;
s/f1/1/;
s/f2/2/;
s/f3/3/;
s/b./b/g;
s/ //g;
# ./cascade.sed two.txt >res.txt
# ./cascade.sed cascade.txt | paste res.txt - | awk '$1 != $2 { print $1 }'
