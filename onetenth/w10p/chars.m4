# chars.m4

dnl blank numbers first
pushdef(`IX', `-10')dnl
dnl
pushdef(`NI', `dnl
pushdef(`I', IX)dnl
popdef(`IX')dnl
pushdef(`IX', incr(I))dnl
`: char'I
eval(L0 | $1) dnl
eval(L1 | $2) dnl
eval(L2 | $3) dnl
eval(L3 | $4) dnl
eval(L4 | $5) dnl
popdef(`I')dnl
')dnl

pushdef(`L0', `0')dnl
pushdef(`L1', `0')dnl
pushdef(`L2', `0')dnl
pushdef(`L3', `0')dnl
pushdef(`L4', `0')dnl

pushdef(`LEFT', `dnl
popdef(`L0')dnl
popdef(`L1')dnl
popdef(`L2')dnl
popdef(`L3')dnl
popdef(`L4')dnl
pushdef(`L0', `eval($1 << 4)')dnl
pushdef(`L1', `eval($2 << 4)')dnl
pushdef(`L2', `eval($3 << 4)')dnl
pushdef(`L3', `eval($4 << 4)')dnl
pushdef(`L4', `eval($5 << 4)')dnl
')dnl

pushdef(`C0', `7, 5, 5, 5, 7')dnl
pushdef(`C1', `2, 2, 2, 2, 2')dnl
pushdef(`C2', `7, 1, 7, 4, 7')dnl
pushdef(`C3', `7, 1, 7, 1, 7')dnl
pushdef(`C4', `5, 5, 7, 1, 1')dnl
pushdef(`C5', `7, 4, 7, 1, 7')dnl
pushdef(`C6', `7, 4, 7, 5, 7')dnl
pushdef(`C7', `7, 1, 1, 1, 1')dnl
pushdef(`C8', `7, 5, 7, 5, 7')dnl
pushdef(`C9', `7, 5, 7, 1, 7')dnl

NI(C0)
NI(C1)
NI(C2)
NI(C3)
NI(C4)
NI(C5)
NI(C6)
NI(C7)
NI(C8)
NI(C9)

LEFT(C0)
NI(C0)
NI(C1)
NI(C2)
NI(C3)
NI(C4)
NI(C5)
NI(C6)
NI(C7)
NI(C8)
NI(C9)

LEFT(C1)
NI(C0)
NI(C1)
NI(C2)
NI(C3)
NI(C4)
NI(C5)
NI(C6)
NI(C7)
NI(C8)
NI(C9)

LEFT(C2)
NI(C0)
NI(C1)
NI(C2)
NI(C3)
NI(C4)
NI(C5)
NI(C6)
NI(C7)
NI(C8)
NI(C9)

LEFT(C3)
NI(C0)
NI(C1)
NI(C2)
NI(C3)
NI(C4)
NI(C5)
NI(C6)
NI(C7)
NI(C8)
NI(C9)

LEFT(C4)
NI(C0)
NI(C1)
NI(C2)
NI(C3)
NI(C4)
NI(C5)
NI(C6)
NI(C7)
NI(C8)
NI(C9)

LEFT(C5)
NI(C0)
NI(C1)
NI(C2)
NI(C3)
NI(C4)
NI(C5)
NI(C6)
NI(C7)
NI(C8)
NI(C9)

LEFT(C6)
NI(C0)
NI(C1)
NI(C2)
NI(C3)
NI(C4)
NI(C5)
NI(C6)
NI(C7)
NI(C8)
NI(C9)

LEFT(C7)
NI(C0)
NI(C1)
NI(C2)
NI(C3)
NI(C4)
NI(C5)
NI(C6)
NI(C7)
NI(C8)
NI(C9)

LEFT(C8)
NI(C0)
NI(C1)
NI(C2)
NI(C3)
NI(C4)
NI(C5)
NI(C6)
NI(C7)
NI(C8)
NI(C9)

LEFT(C9)
NI(C0)
NI(C1)
NI(C2)
NI(C3)
NI(C4)
NI(C5)
NI(C6)
NI(C7)
NI(C8)
NI(C9)

: char:
0 128 0 128 0

: chark
144 160 192 160 144

popdef(`L0')dnl
popdef(`L1')dnl
popdef(`L2')dnl
popdef(`L3')dnl
popdef(`L4')dnl
popdef(`C0')dnl
popdef(`C1')dnl
popdef(`C2')dnl
popdef(`C3')dnl
popdef(`C4')dnl
popdef(`C5')dnl
popdef(`C6')dnl
popdef(`C7')dnl
popdef(`C8')dnl
popdef(`C9')dnl
popdef(`NI')dnl
popdef(`IX')dnl
