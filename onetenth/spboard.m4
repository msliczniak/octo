# spboard.m4

pushdef(`_SPBOARD', `_spboard')dnl
dnl SPBOARD(i, j, Mi, Mj, Su)
dnl   i: upper board position
dnl   j: lower paired board element
dnl   M: masks for i and j
dnl   S: upper sprite
pushdef(`SPBOARD', `dnl
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
load B0
i := spritebu:$5
save B0

i := isym0
i += B$2
SPMASK := $4
SPMASK &= GHOST
if SPMASK == 0
then i := sym0
load B0
i := spritebl:$5
save B0

: _SPBOARD,end,$*
')dnl

dnl 0 4   8 C     0 4   8 C     6 4 2 0   E C A 8
dnl 1 5   9 D  V  1 5   9 D  |  7 5 3 1   F D B 9
dnl
dnl 2 6   A E  |  2 6   A E
dnl 3 7   B F     3 7   B F
#: spbv
: spb,s
load B7
SPBOARD(0, 1, 128, 64, 0)
SPBOARD(2, 3,  32, 16, 1)
SPBOARD(4, 5,   8,  4, 2)
SPBOARD(6, 7,   2,  1, 3)
return

dnl 0 4   8 C     F B   7 3     E C A 8   6 4 2 0
dnl 1 5   9 D  ^  E A   6 2  |  F D B 9   7 5 3 1
dnl
dnl 2 6   A E  |  D 9   5 1
dnl 3 7   B F     C 8   4 0
: spb,n
load B7
SPBOARD(1, 0, 64, 128, 0)
SPBOARD(3, 2, 16,  32, 1)
SPBOARD(5, 4,  4,   8, 2)
SPBOARD(7, 6,  1,   2, 3)
return

dnl 0 4   8 C     0 1   2 3     0 4 8 C   2 6 A E
dnl 1 5   9 D  >  4 5   6 7  |  1 5 9 D   3 7 B F
dnl
dnl 2 6   A E  |  8 9   A B
dnl 3 7   B F     C D   E F
#: spbh
: spb,e
load B7
SPBOARD(0, 4, 128,  8, 0)
SPBOARD(1, 5,  64,  4, 1)
SPBOARD(2, 6,  32,  2, 2)
SPBOARD(3, 7,  16,  1, 3)
return

dnl 0 4   8 C     F E   D C     2 6 A E   0 4 8 C
dnl 1 5   9 D  <  B A   9 8  |  3 7 B F   1 5 9 D
dnl
dnl 2 6   A E  |  7 6   5 4
dnl 3 7   B F     3 2   1 0
: spb,w
load B7
SPBOARD(4, 0,  8, 128, 0)
SPBOARD(5, 1,  4,  64, 1)
SPBOARD(6, 2,  2,  32, 2)
SPBOARD(7, 3,  1,  16, 3)
return

popdef(`SPBOARD')
