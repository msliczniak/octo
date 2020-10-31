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
i := prevboard0
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
i := prevboard2
save v7
i := board2
save v7

i := prevboard0
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
i := prevboard
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
i := prevboard
save vf
return

# trivial - only save the board state
: tt
i := board
load vf
i := prevboard
save vf
return
