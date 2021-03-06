# trans.m4

# flip
# 0 4 8 C   F B 7 3
# 1 5 9 D   E A 6 2
# 2 6 A E   D 9 5 1
# 3 7 B F   C 8 4 0
: tf
i := board0
load v7
vf := v0
ve := v1
vd := v2
vc := v3
vb := v4
va := v5
v9 := v6
v8 := v7

i := board2
load v3
v7 := v0
v6 := v1
v5 := v2
v4 := v3

i := board3
load v1
v3 := v0
v2 := v1

i := board-e
load v0
v1 := v0

i := board-f
load v0

i := board0
save vf
return

# clockwise
# <F. <3  <7  <B    .F>  0>  1>  2>
# <0  <4. <8  <C     3> .4>  5>  6>
# <1  <5  <9. <D     7>  8> .9>  A>
# <2  <6  <A  <E.    B>  C>  D> .E>
: tcw
i := board-1
load ve
dnl V0 V1 V2 V3 V4 V5 V6 V7 V8 V9 VA VB VC VD VE VF
dnl <0 <1 <2 <3 <4 <5 <6 <7 <8 <9 <A <B <C <D <E

vf := ve
ve := va
va := v9
v9 := v5
v5 := v4
v4 := v0
v0 := vd
dnl V0 V1 V2 V3 V4 V5 V6 V7 V8 V9 VA VB VC VD VE VF
dnl  D <1 <2 <3 0> 4> <6 <7 <8 >5 9> <B <C <D A> E>

vd := v6
v6 := v8
v8 := v1
v1 := v3
v3 := vb
vb := v0
v0 := vc
dnl V0 V1 V2 V3 V4 V5 V6 V7 V8 V9 VA VB VC VD VE VF
dnl  C 3> <2 B> 0> 4> 8> <7 1> >5 9> D> <C 6> A> E>

vc := v2
v2 := v7
v7 := v0
i := board
load v0
dnl V0 V1 V2 V3 V4 V5 V6 V7 V8 V9 VA VB VC VD VE VF
dnl  F 3> 7> B> 0> 4> 8> C> 1> >5 9> D> 2> 6> A> E>

i := board
save vf
return

# counter clockwise
# <F  <3  <7  <B.    E>  D>  C> .B>
# <0  <4  <8. <C     A>  9> .8>  7>
# <1  <5. <9  <D     6> .5>  4>  3>
# <2. <6  <A  <E    .2>  1>  0>  F>
: tccw
i := board-1
load vd
dnl V0 V1 V2 V3 V4 V5 V6 V7 V8 V9 VA VB VC VD VE VF
dnl <0 <1 <2 <3 <4 <5 <6 <7 <8 <9 <A <B <C <D

ve := v3
v3 := v2
v2 := v6
v6 := v5
v5 := v9
v9 := v8
v8 := vc
vc := vb
vb := v0
v0 := vd
dnl V0 V1 V2 V3 V4 V5 V6 V7 V8 V9 VA VB VC VD VE VF
dnl  D <1 6> 2> <4 9> 5> <7 C> 8> <A 0> B> <D 3>

vd := v7
v7 := v1
v1 := va
va := v4
v4 := v0
dnl V0 V1 V2 V3 V4 V5 V6 V7 V8 V9 VA VB VC VD VE VF
dnl  D A> 6> 2> D> 9> 5> 1> C> 8> 4> 0> B> 7> 3>

i := board
load v0
vf := v0
i := board-f
load v0
dnl V0 V1 V2 V3 V4 V5 V6 V7 V8 V9 VA VB VC VD VE VF
dnl E> A> 6> 2> D> 9> 5> 1> C> 8> 4> 0> B> 7> 3> F>

i := board
save vf

# FALLTHRU
: tt    # trivial
return

dnl >>> def xy(s):
dnl ...     x = 12
dnl ...     x &= s
dnl ...     x <<= 1
dnl ...     y = 3
dnl ...     y &= s
dnl ...     y <<= 3
dnl ...     return x, y
dnl ...
dnl >>> xy(0)
dnl (0, 0)
dnl >>> xy(3)
dnl (0, 24)
dnl >>> xy(12)
dnl (24, 0)
dnl >>> xy(15)
dnl (24, 24)
: txy
X := 12
X &= S
X <<= X
Y := 3
Y &= S
Y <<= Y
Y <<= Y
Y <<= Y
i := main_regs
return

: tgt
:call txy
Y += 32
save Z
v0 := GHOST0
v1 := GHOST1
jump _tgret

REGS(`TRANS', 2)
PUSHREG(`TRANS', `B0')
PUSHREG(`TRANS', `B1')
PUSHREG(`TRANS', `B2')
PUSHREG(`TRANS', `B3')
PUSHREG(`TRANS', `B4')
PUSHREG(`TRANS', `B5')
PUSHREG(`TRANS', `B6')
PUSHREG(`TRANS', `B7')

dnl >>> def f(s):
dnl ...     x, y = xy(s)
dnl ...     s = 24
dnl ...     x = s - x
dnl ...     y = s - y
dnl ...     return x, y
dnl ...
dnl >>> f(0)
dnl (24, 24)
dnl >>> f(3)
dnl (24, 0)
dnl >>> f(12)
dnl (0, 24)
dnl >>> f(15)
dnl (0, 0)
: tgf
:call txy
S := 24
X =- S
Y =- S
Y += 32
save Z
i := _tgf
jump _tg

dnl >>> def ccw(s):
dnl ...     x, y = xy(s)
dnl ...     s = x
dnl ...     x = y
dnl ...     y = s
dnl ...     s = 24
dnl ...     x = s - x
dnl ...     y = s - y
dnl ...     return x, y
dnl ...
dnl >>> ccw(0)
dnl (24, 24)
dnl >>> ccw(3)
dnl (0, 24)
dnl >>> ccw(12)
dnl (24, 0)
dnl >>> ccw(15)
dnl (0, 0)
: tgccw
:call txy
S := X
X := Y
Y := S
S := 24
X =- S
Y =- S
Y += 32
save Z
i := _tgccw
MEM0 := eval(48 | 3)
MEM1 := eval(192 | 12)
B1 := MEM1
MEM1 &= GHOST1
B1   &= GHOST0
B1 >>= B1
B1 >>= B1
MEM1 |= B1

B0 := MEM0
MEM0 &= GHOST0
B0   &= GHOST1
B0 <<= B0
B0 <<= B0
MEM0 |= B0

GHOST0 := MEM1
GHOST1 := MEM0
jump _tg

dnl >>> def cw(s):
dnl ...     x, y = xy(s)
dnl ...     s = x
dnl ...     x = y
dnl ...     y = s
dnl ...     return x, y
dnl ...
dnl >>> cw(0)
dnl (0, 0)
dnl >>> cw(3)
dnl (24, 0)
dnl >>> cw(12)
dnl (0, 24)
dnl >>> cw(15)
dnl (24, 24)
: tgcw
:call txy
S := X
X := Y
Y := S
Y += 32
save Z
i := _tgcw
MEM0 := eval(192 | 12)
MEM1 := eval(48 | 3)
B1 := MEM1
MEM1 &= GHOST1
B1   &= GHOST0
B1 <<= B1
B1 <<= B1
MEM1 |= B1

B0 := MEM0
MEM0 &= GHOST0
B0   &= GHOST1
B0 >>= B0
B0 >>= B0
MEM0 |= B0

GHOST0 := MEM1
GHOST1 := MEM0

# FALLTHRU
: _tg
load B7
ve := 128

pushdef(`M', `dnl
MEM1 >>= MEM1
MEM0 := B$1
MEM0 &= GHOST0
if MEM0 != 0
then MEM1 |= ve
')dnl
M(0)
M(1)
M(2)
M(3)
M(4)
M(5)
M(6)
M(7)
popdef(`M')dnl

pushdef(`M', `dnl
MEM0 >>= MEM0
B$1 &= GHOST1
if B$1 != 0
then MEM0 |= ve
')dnl
M(0)
M(1)
M(2)
M(3)
M(4)
M(5)
M(6)
M(7)
popdef(`M')dnl

: _tgret
i := bghost0
save MEM1

dnl ghost the screen
: _bb1
vd := 0     # black
v2 := 0

: _tgreth0
v3 := 32

: _tgretv0
MEM0 <<= MEM0
if vf != 0
then : __tgretv0 :byte 0xb2 0xd2

v3 += 8
if v3 != 64
then jump _tgretv0

v2 += 8
if v2 != 16
then jump _tgreth0

: _tgreth1
v3 := 32

: _tgretv1
MEM1 <<= MEM1
if vf != 0
then : __tgretv1 :byte 0xb2 0xd2

v3 += 8
if v3 != 64
then jump _tgretv1

v2 += 8
if v2 != 32
then jump _tgreth1

return

POPREGS(`TRANS', 2)
DELREGS(`TRANS')

: transform
: _transform
jump tt     # up is convenietly 2, the same length as this one instruction
jump tf
jump tccw
jump tcw
: _tghosts
jump tt

:call tgf
:call tgccw
:call tgcw
: _tgf
:call tgt

128
 64
 32
 16
  8
  4
: _tgcw
  2
  1

  1
 16
  4
 64
  2
 32
: _tgccw
  8
128

 32
  2
128
  8
 16
  1
 64
  4
