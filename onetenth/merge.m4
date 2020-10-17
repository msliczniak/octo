dnl define(`FOO', `0')dnl
dnl a FOO
dnl define(`FOO', `1')dnl
dnl b FOO
dnl define(`FOO', incr(FOO))dnl
dnl b FOO
dnl d defn(`FOO')
dnl e FOO
dnl m4exit(0)
dnl include(`loop.m4')dnl
dnl
dnl GT(n, m)
dnl
define(`GT',`dnl
# if ($1 > $2)
  vF := $2
  vF -= $1
  if vF == 0')dnl
dnl
dnl PUSHREG(n)
dnl
:alias r0 v0
:alias r1 v1
:alias r2 v2
:alias r3 v3
:alias r4 v4
:alias r5 v5
:alias r6 v6
:alias r7 v7
:alias r8 v8
:alias r9 v9
:alias r10 va
:alias r11 vb
:alias r12 vc
:alias r13 vd
:alias r14 ve

dnl
define(`PUSHREG', `dnl
ifelse(_R, `15', `errprint(`too many registers: $1
')m4exit(1)')dnl
dnl ifelse(_R, `15', `m4exit(1)')dnl
define($1, `r''`_R)dnl
`  # $1' `r''`_R dnl
define(`_R'_R, `$1')dnl
define(`_R', incr(_R))dnl
')dnl
: main

divert(incr(divnum))dnl
dnl
divert(decr(divnum))dnl
define(`BL',`0')dnl

pushdef(`_R', `0')
PUSHREG(`R3')
PUSHREG(`R2')
PUSHREG(`R1')
PUSHREG(`R0')

PUSHREG(`FREE')
PUSHREG(`FREE0')
PUSHREG(`FREE1')
PUSHREG(`FREE2')
PUSHREG(`FREE3')

PUSHREG(`GHOST0')
PUSHREG(`GHOST1')

PUSHREG(`MAXSYM')
PUSHREG(`SCORE')
`#' _R

divert(incr(divnum))dnl
dnl
: col

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
ifelse($1, $2, `FREE0 := eval(17 << $1) # faster than extra jumps')
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

 if R$1 != `R''`incr($1)
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
