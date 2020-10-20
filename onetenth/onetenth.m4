include(`chip8.m')dnl
: main

divert(incr(divnum))dnl
dnl
divert(decr(divnum))dnl
define(`BL',`0')dnl

divert(incr(divnum))dnl
dnl
: col

REGS(`COL', 0)
PUSHREG(`COL', `R3')
PUSHREG(`COL', `R2')
PUSHREG(`COL', `R1')
PUSHREG(`COL', `R0')

PUSHREG(`COL', `FREE')
PUSHREG(`COL', `FREE0')
PUSHREG(`COL', `FREE1')
PUSHREG(`COL', `FREE2')
PUSHREG(`COL', `FREE3')

PUSHREG(`COL', `GHOST0')
PUSHREG(`COL', `GHOST1')

PUSHREG(`COL', `MAXSYM')
PUSHREG(`COL', `SCORE')

#  0x11 = 17
dnl
dnl COLLAPSE(i, j)
dnl
define(`_COLLAPSE', `_col_collapse')dnl
dnl
divert(decr(divnum))dnl
# there is nothing to merge
: _COLLAPSE,4,0
GHOST0  := 0
FREE0   := 4

return
divert(incr(divnum))dnl
dnl
define(`COLLAPSE', `dnl
dnl
: _COLLAPSE,$*
ifelse($1, $2, `FREE0 := eval(17 << $1)')
if R$1 == BL
then jump _COLLAPSE,incr($1),$2
GHOST0 := eval((17 << ($1 + 1)) & 255)
# FALLTHRU
')dnl
dnl
COLLAPSE(0, 0)
COLLAPSE(1, 1)
COLLAPSE(2, 2)
COLLAPSE(3, 3)
: _COLLAPSE,4,4
GHOST0  := 0
jump _COLLAPSE,4

COLLAPSE(2, 0)
COLLAPSE(3, 1)
: _COLLAPSE,4,2
GHOST0  -= FREE0
jump _COLLAPSE,2

COLLAPSE(3, 0)
: _COLLAPSE,4,1
GHOST0  -= FREE0
jump _COLLAPSE,3

COLLAPSE(1, 0)
COLLAPSE(2, 1)
COLLAPSE(3, 2)
: _COLLAPSE,4,3
GHOST0  -= FREE0
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
 if R$1 == BL
 then jump _MERGE,b,$*

pushdef(`ex', R$`'1)dnl
 if R$1 != ex(incr($1))
popdef(`ex')dnl
 then jump _MERGE,incr($1),incr($2)

 SCORE += R$1
 R$1 += 8

 GT(R$1, MAXSYM)
 then MAXSYM := R$1

ifelse($1, $2, `dnl
 vF := eval(17 << $1)
 GHOST0 |= vF
')dnl

 # FALLTHRU
')dnl

MERGE(0, 0)
MERGE(2, 1)
FREE0   := 2
R2      := BL
R3      := BL
return

MERGE(1, 1) # <- merge(0, 0)
R2 := R3
R3 := BL
FREE0   := 1
if R2 == BL
then FREE0 := 2
return

MERGE(2, 2) # <- merge(1, 1)
FREE0 := 1
R3 := BL
return

: _MERGE,4,2 # <- merge(2, 2)
FREE0   := 1
R3      := BL
return

: _MERGE,b,0,0
FREE0   := 4
return

: _MERGE,b,1,1
FREE0   := 3
return

: _MERGE,b,2,1
FREE0   := 3
R1 := BL
return

: _MERGE,b,2,2
FREE0   := 2
return

: _MERGE,3,2 # mere(2,1)
: _MERGE,3,3 # <- merge(2, 2)
FREE0   := 0
if R3 == BL
then FREE0 := 1
return
dnl
POPREGS(`COL', 0)
DELREGS(`COL')
