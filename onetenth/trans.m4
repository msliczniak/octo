# trans.m4

# flip
# 0 4 8 C   F B 7 3
# 1 5 9 D   E A 6 2
# 2 6 A E   D 9 5 1
# 3 7 B F   C 8 4 0
: tf
i := board2-7
load ve
v0 := ve
v1 := vd
v2 := vc
v3 := vb
v4 := va
v5 := v9
v6 := v8
i := zboard0
save v7

i := board0-7
load ve
v0 := ve
v1 := vd
v2 := vc
v3 := vb
v4 := va
v5 := v9
v6 := v8
i := zboard2
save v7
i := board2
save v7

i := zboard0
load v7
i := board0
save v7
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
save ve
i := zboard
save vf
return

# counter clockwise
# <F  <3  <7  <B.    E>  D>  C> .B>
# <0  <4  <8. <C     A>  9> .8>  7>
# <1  <5. <9  <D     6> .5>  4>  3>
# <2. <6  <A  <E    .2>  1>  0>  F>
: tccw
# :call munge
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
i := zboard
save vf
return

# trivial - only save the board state
: tt
i := board
load vf
i := zboard
save vf
return

: tgt
v0 := GHOST0
v1 := GHOST1
i := bghost0
save v1
return

REGS(`TRANS', 2)
PUSHREG(`TRANS', `B0')
PUSHREG(`TRANS', `B1')
PUSHREG(`TRANS', `B2')
PUSHREG(`TRANS', `B3')
PUSHREG(`TRANS', `B4')
PUSHREG(`TRANS', `B5')
PUSHREG(`TRANS', `B6')
PUSHREG(`TRANS', `B7')

: tgf
i := _tgf
jump _tg

: tgcw
i := _tgcw
jump _rot

: tgccw
i := _tgccw
B0     := GHOST0
GHOST0 := GHOST1
GHOST1 := B0

# FALLTHRU
: _rot
MEM1 := eval(48 | 3)
MEM1 &= GHOST1
B0   :=  eval(48 | 3)
B0   &= GHOST0
B0 <<= B0
B0 <<= B0
MEM1 |= B0

MEM0 := eval(192 | 12)
MEM0 &= GHOST0
B0   := eval(192 | 12)
B0   &= GHOST1
B0 >>= B0
B0 >>= B0
MEM0 |= B0

GHOST0 := MEM0
GHOST1 := MEM1

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

i := bghost0
save MEM1
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
