# merge.m4

: col

dnl >>> for i in xrange(4):
dnl ...     for j in xrange(i):
dnl ...             print bin((1 << i) - (1 << j))
dnl ...
dnl 0b1
dnl 0b11
dnl 0b10
dnl 0b111
dnl 0b110
dnl 0b100
dnl
#  0x11 = 17
dnl
dnl COLLAPSE(i, j)
dnl
define(`_COLLAPSE', `_col_collapse')dnl
dnl
divert(incr(divnum)) # merge.m4 dnl
# there is nothing to merge
: _COLLAPSE,4,0
GHOST1  := 0
FREE3   := 4
return
divert(decr(divnum)) # merge.m4 dnl
dnl
define(`COLLAPSE', `dnl
dnl
: _COLLAPSE,$*
ifelse($1, $2, `FREE3 := eval(17 << $1)')
if R$1 == BL
then jump _COLLAPSE,incr($1),$2
GHOST1 := eval((17 << ($1 + 1)) & 255)
ifelse($1, $2, `', `R$2 := R$1')
# FALLTHRU
')dnl
dnl
COLLAPSE(0, 0)
COLLAPSE(1, 1)
COLLAPSE(2, 2)
COLLAPSE(3, 3)
: _COLLAPSE,4,4
GHOST1  := 0
jump _COLLAPSE,4

COLLAPSE(1, 0)
COLLAPSE(2, 1)
COLLAPSE(3, 2)
: _COLLAPSE,4,3
GHOST1  -= FREE3
jump _COLLAPSE,3

COLLAPSE(2, 0)
COLLAPSE(3, 1)
: _COLLAPSE,4,2
GHOST1  -= FREE3
jump _COLLAPSE,2

COLLAPSE(3, 0)
: _COLLAPSE,4,1
GHOST1  -= FREE3
# FALLTHRU

: _COLLAPSE,1
R1 := BL
: _COLLAPSE,2
R2 := BL
: _COLLAPSE,3
R3 := BL
: _COLLAPSE,4
# FALLTHRU

dnl
dnl MERGE(i, j)
dnl
define(`_MERGE', `_col_merge')dnl
dnl
define(`MERGE',`dnl
:  _MERGE,$*
ifelse(`$1', `0', `', `dnl
 if R$1 == BL
 then jump _MERGE,b,$*
')dnl

 if R$1 != _CC(`R', incr($1))
 then jump _MERGE,incr($1),incr($2)

 SCORE += R$1
 R$1 += 11
ifelse(`$1', `$2', `', `R$2 := R$1')

 GT(R$1, MAXSYM)
 then MAXSYM := R$1

 # FALLTHRU
')dnl

MERGE(0, 0)
MERGE(2, 1)
R2      := BL
R3      := BL
GHOST1  := 0xff
FREE3   := 2
return

MERGE(1, 1) # <- merge(0, 0)
R2 := R3
R3 := BL
if R2 != BL
then jump _MERGE,f1
FREE3 := eval((17 << 2) | (17 << 1))
GHOST1 |= FREE3
FREE3 := 2
return

: _MERGE,f1
FREE3 := eval((17 << 3) | (17 << 2) | (17 << 1))
GHOST1 |= FREE3
FREE3 := 1
return

MERGE(2, 2) # <- merge(1, 1)
R3 := BL
FREE3 := eval((17 << 3) | (17 << 2))
GHOST1 |= FREE3
FREE3 := 1
return

: _MERGE,b,1,1
FREE3   := 3
return

: _MERGE,b,2,1
R1 :=   BL
FREE3 := eval((17 << 1) | 17)
GHOST1 |= FREE3
FREE3   := 3
return

: _MERGE,b,2,2
FREE3   := 2
return

: _MERGE,3,2 # <- merge(2,1)
R1 := R2
R2 := R3
R3 := BL
if R2 == BL
then jump _MERGE,f2
FREE3 := eval((17 << 3) | (17 << 2) | (17 << 1) | 17)
GHOST1 |= FREE3
FREE3 := 1
return

: _MERGE,f2
FREE3 := eval((17 << 2) | (17 << 1) | 17)
GHOST1 |= FREE3
FREE3 := 2
return

: _MERGE,3,3 # <- merge(2, 2)
FREE3   := 0
if R3 == BL
then FREE3 := 1
return
