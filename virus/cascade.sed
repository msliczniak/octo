#!/usr/bin/sed -f
s/C0/0/;
s/C1/1/;
s/C2/2/;
s/C3/3/;
s/F0/0/;
s/F1/1/;
s/F2/2/;
s/F3/3/;
s/B./B/g;
s/ /,/g;
# ./cascade.sed two.txt >res.txt
# ./cascade.sed cascade.txt | paste res.txt - | awk '$1 != $2 { print $1 }'
