# chars.m4

pushdef(`IX', `0')dnl
dnl
pushdef(`NI', `dnl
pushdef(`I', IX)dnl
popdef(`IX')dnl
pushdef(`IX', incr(I))dnl
`: char'I
eval(($1 << 4) | $1) dnl
eval(($2 << 4) | $2) dnl
eval(($3 << 4) | $3) dnl
eval(($4 << 4) | $4) dnl
eval(($5 << 4) | $5) dnl
divert(incr(divnum))dnl
`: ichar'I
eval((($1 << 4) | $1) ^ 255) dnl
eval((($2 << 4) | $2) ^ 255) dnl
eval((($3 << 4) | $3) ^ 255) dnl
eval((($4 << 4) | $4) ^ 255) dnl
eval((($5 << 4) | $5) ^ 255)
divert(decr(divnum))dnl
popdef(`I')dnl
')dnl

NI(7, 5, 5, 5, 7)#0
NI(2, 2, 2, 2, 2)#1
NI(7, 1, 7, 4, 7)#2
NI(7, 1, 7, 1, 7)#3
NI(5, 5, 7, 1, 1)#4
NI(7, 4, 7, 1, 7)#5
NI(7, 4, 7, 5, 7)#6
NI(7, 1, 1, 1, 1)#7
NI(7, 5, 7, 5, 7)#8
NI(7, 5, 7, 1, 7)#9

: char:
0 128 0 128 0

: chark
144 160 192 160 144

popdef(`NI')dnl
popdef(`IX')dnl
