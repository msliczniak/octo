# spboard.m4

pushdef(`_SPBOARD', `_spboard')dnl
dnl SPBOARD(i, j, Mi, Mj, Su, Sl)
dnl   i: upper board position
dnl   j: lower paired board element
dnl   M: masks for i and j
dnl   S: upper/lower sprite
pushdef(`SPBOARD', `dnl
ifelse(`$1', `0', `dnl
load B7
SPOFF := vf
')dnl
SPMASK := eval($3 | $4)
SPMASK &= GHOST
if SPMASK == 0
then jump _SPBOARD,end,$*

i := isym0
i += B$1
SPMASK := $3
SPMASK &= GHOST
if SPMASK == 0
then i := sym0
ifelse(`$1', `0', `dnl
vf := SPOFF
')dnl
load B0
i := sprite:$5
i += R
save B0

i := isym0
i += B$2
SPMASK := $4
ifelse(`$1', `0', `dnl
SPOFF := vf
')dnl
SPMASK &= GHOST
if SPMASK == 0
then i := sym0
ifelse(`$1', `0', `dnl
vf := SPOFF
')dnl
load B0
i := sprite:$6
i += R
save B0

ifelse(`$1', `0', `dnl
SPOFF := vf
')dnl
: _SPBOARD,end,$*
ifelse(`$1', `0', `dnl
pushdef(`R', `_CC(B, `$2')')dnl
R := SPOFF
')dnl
ifelse(`$2', `7', `dnl
DSPOFF := R
popdef(`R')dnl
')dnl
')dnl

pushdef(`R', `vf')dnl

dnl 0 4   8 C     0 4   8 C     6 4 2 0   E C A 8
dnl 1 5   9 D  V  1 5   9 D  |  7 5 3 1   F D B 9
dnl
dnl 2 6   A E  |  2 6   A E
dnl 3 7   B F     3 7   B F
: spb,s
SPBOARD(0, 1, 128, 64, 0, 1)
SPBOARD(2, 3,  32, 16, 2, 3)
SPBOARD(4, 5,   8,  4, 4, 5)
SPBOARD(6, 7,   2,  1, 6, 7)
return

dnl 0 4   8 C     F B   7 3     E C A 8   6 4 2 0
dnl 1 5   9 D  ^  E A   6 2  |  F D B 9   7 5 3 1
dnl
dnl 2 6   A E  |  D 9   5 1
dnl 3 7   B F     C 8   4 0
: spb,n
SPBOARD(0, 1, 128, 64, 1, 0)
SPBOARD(2, 3,  32, 16, 3, 2)
SPBOARD(4, 5,   8,  4, 5, 4)
SPBOARD(6, 7,   2,  1, 7, 6)
return

dnl 0 4   8 C     0 1   2 3     0 4 8 C   2 6 A E
dnl 1 5   9 D  >  4 5   6 7  |  1 5 9 D   3 7 B F
dnl
dnl 2 6   A E  |  8 9   A B
dnl 3 7   B F     C D   E F
: spb,e
SPBOARD(0, 4, 128,  8, 0, 1)
SPBOARD(1, 5,  64,  4, 2, 3)
SPBOARD(2, 6,  32,  2, 4, 5)
SPBOARD(3, 7,  16,  1, 6, 7)
return

dnl 0 4   8 C     F E   D C     2 6 A E   0 4 8 C
dnl 1 5   9 D  <  B A   9 8  |  3 7 B F   1 5 9 D
dnl
dnl 2 6   A E  |  7 6   5 4
dnl 3 7   B F     3 2   1 0
: spb,w
SPBOARD(0, 4, 128,  8, 1, 0)
SPBOARD(1, 5,  64,  4, 3, 2)
SPBOARD(2, 6,  32,  2, 5, 4)
SPBOARD(3, 7,  16,  1, 7, 6)
return

popdef(`R')dnl
popdef(`SPBOARD')dnl
