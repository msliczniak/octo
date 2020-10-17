dnl include(loop.m4)

: main

divert(incr(divnum))dnl
dnl
divert(decr(divnum))dnl
define(`BL',`0')dnl

:alias r3 v0
:alias r2 v1
:alias r1 v2
:alias r0 v3

:alias free     v4
:alias free0    v5
:alias free1    v6
:alias free2    v7
:alias free3    v8

:alias ghost0   v9
:alias ghost1   vA

:alias maxsym   vB
:alias score    vC

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
ghost0  := 0
free0   := 4

return
divert(incr(divnum))dnl
dnl
define(`COLLAPSE', `dnl
dnl
: _COLLAPSE,$*
ifelse($1, $2, `free0 := eval(17 << $1) # faster than extra jumps')
if r$1 == BL
then jump _COLLAPSE,incr($1),$2
ghost0 := eval((17 << ($1 + 1)) & 255)
# FALLTHRU
')dnl
dnl
COLLAPSE(0, 0)
COLLAPSE(1, 1)
COLLAPSE(2, 2)
COLLAPSE(3, 3)
: _COLLAPSE,4,4
ghost0  := 0
jump _COLLAPSE,4

COLLAPSE(2, 0)
COLLAPSE(3, 1)
: _COLLAPSE,4,2
ghost0  -= free0
jump _COLLAPSE,2

COLLAPSE(3, 0)
: _COLLAPSE,4,1
ghost0  -= free0
jump _COLLAPSE,3

COLLAPSE(1, 0)
COLLAPSE(2, 1)
COLLAPSE(3, 2)
: _COLLAPSE,4,3
ghost0  -= free0
# FALLTHRU

: _COLLAPSE,1
r1 := BL
: _COLLAPSE,2
r2 := BL
: _COLLAPSE,3
r3 := BL
: _COLLAPSE,4
# FALLTHRU

dnl
dnl MERGE(i, j)
dnl
define(`_MERGE', `_col_merge')dnl
dnl
define(`MERGE',`dnl
:  _MERGE,$*
 if r$1 == BL
 then jump _MERGE,b,$*

 if r$1 != `r''`incr($1)
 then jump _MERGE,incr($1),incr($2)

 score += r$1
 r$1 += 8

 # if r$1 > maxsym
 vF := maxsym
 vF -= r$1
 if vF == 0
 then maxsym := r$1

ifelse($1, $2, `dnl
 vF := eval(17 << $1)
 ghost0 |= vF
')dnl

 # FALLTHRU
')dnl

MERGE(0, 0)
MERGE(2, 1)
free0   := 2
r2      := BL
r3      := BL
return

MERGE(1, 1) # <- merge(0, 0)
r2 := r3
r3 := BL
free0   := 1
if r2 == BL
then free0 := 2
return

MERGE(2, 2) # <- merge(1, 1)
free0 := 1
r3 := BL
return

: _MERGE,4,2 # <- merge(2, 2)
free0   := 1
r3      := BL
return

: _MERGE,b,0,0
free0   := 4
return

: _MERGE,b,1,1
free0   := 3
return

: _MERGE,b,2,1
free0   := 3
r1 := BL
return

: _MERGE,b,2,2
free0   := 2
return

: _MERGE,3,2 # mere(2,1)
: _MERGE,3,3 # <- merge(2, 2)
free0   := 0
if r3 == BL
then free0 := 1
return
