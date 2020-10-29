# spboard.m4

dnl >>> def f(i, j):
dnl ...     return ((128 >> i) >> j) | (128 >> i)
dnl ...
dnl >>> map(bin, (f(0, 4), f(1, 4), f(2, 4), f(3, 4)))
dnl ['0b10001000', '0b1000100', '0b100010', '0b10001']
dnl >>> map(bin, (f(0, 1), f(2, 1), f(4, 1), f(6, 1)))
dnl ['0b11000000', '0b110000', '0b1100', '0b11']

dnl >>> def g(i, j):
dnl ...     return (((i) + (j >> 2)) - (j >> 2)) >> (j & 1)
dnl ... 
dnl >>> g(0, 4), g(1, 4), g(2, 4), g(3, 4)
dnl (0, 1, 2, 3)
dnl >>> g(0, 1), g(2, 1), g(4, 1), g(6, 1)
dnl (0, 1, 2, 3)
dnl >>> g(7, -1), g(5, -1), g(3, -1), g(1, -1)
dnl (3, 2, 1, 0)

dnl prepare sprites from board
dnl
dnl SPBPARD(i, j)
dnl   i: first board position
dnl   j: offset to paired board element
dnl
pushdef(`_SPBOARD', `_spboard')dnl
pushdef(`SPBOARD', `dnl
ifelse(`$2', `-1', `dnl
SPMASK := eval(((128 >> ($1 - 1)) >> 1) | (128 >> ($1 - 1))) dnl
', `dnl
SPMASK := eval(((128 >> $1) >> $2) | (128 >> $1)) dnl
')dnl

SPMASK &= GHOST
if SPMASK == 0
then jump _SPBOARD,end,$*

i := isym0
i += B$1
SPMASK := eval(128 >> $1)
SPMASK &= GHOST
if SPMASK == 0
then i := sym0
load B0
i := spritebu:eval(((($1) + ($2 >> 2)) - ($2 >> 2)) >> ($2 & 1))
save B0

i := isym0
i += _CC(`B', eval($1 + $2))
SPMASK := eval((128 >> $1) >> $2)
SPMASK &= GHOST
if SPMASK == 0
then i := sym0
load B0
i := spritebl:eval(((($1) + ($2 >> 2)) - ($2 >> 2)) >> ($2 & 1))
save B0

: _SPBOARD,end,$*
')dnl

dnl 0 4   8 C     0 4   8 C     0 4 8 C
dnl 1 5   9 D  |  1 5   9 D  |  1 5 9 D
dnl
dnl 2 6   A E  |  2 6   A E  |  2 6 A E
dnl 3 7   B F     3 7   B F     3 7 B F
: spbv
: spb0
: spb4
SPBOARD(0, 1)
SPBOARD(2, 1)
SPBOARD(4, 1)
SPBOARD(6, 1)
return

dnl XXX u and l swapped
dnl 0 4   8 C     F E   D C     E A 6 2
dnl 1 5   9 D  |  B A   9 8  |  F B 7 3
dnl
dnl 2 6   A E  |  7 6   5 4  |  C 8 4 0
dnl 3 7   B F     3 2   1 0     D 9 5 1

dnl 0 4   8 C     0 1   2 3     0 4 8 C
dnl 1 5   9 D  |  4 5   6 7  |  1 5 9 D
dnl
dnl 2 6   A E  |  8 9   A B  |  2 6 A E
dnl 3 7   B F     C D   E F     3 7 B F
: spbh
: spb2
SPBOARD(0, 4)
SPBOARD(1, 4)
SPBOARD(2, 4)
SPBOARD(3, 4)
return

dnl 0 4   8 C     F B   7 3     E A 6 2
dnl 1 5   9 D  |  E A   6 2  |  F B 7 3
dnl
dnl 2 6   A E  |  D 9   5 1  |  C 8 4 0
dnl 3 7   B F     C 8   4 0     D 9 5 1
: spb6
SPBOARD(7, -1)
SPBOARD(5, -1)
SPBOARD(3, -1)
SPBOARD(1, -1)
return
