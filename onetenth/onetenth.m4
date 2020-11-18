include(`defines.m')

dnl Z is the orientation
dnl
dnl 0 |   2       4 /|   6 
dnl   |    -----     |     -----
dnl   |/       /     |     \
dnl
REGS(`MAIN', 0)
PUSHREG(`MAIN', `MEM0')
PUSHREG(`MAIN', `MEM1')
PUSHREG(`MAIN', `KEY')
PUSHREG(`MAIN', `OX')
PUSHREG(`MAIN', `OY')
PUSHREG(`MAIN', `S')
PUSHREG(`MAIN', `M')
PUSHREG(`MAIN', `X')
PUSHREG(`MAIN', `Y')
PUSHREG(`MAIN', `Z')

REGS(`COL', 0)
PUSHREG(`COL', `R3')dnl		v0
PUSHREG(`COL', `R2')dnl		 1
PUSHREG(`COL', `R1')dnl 	 2
PUSHREG(`COL', `R0')dnl 	 3

PUSHREG(`COL', `FREE0')dnl	v4
PUSHREG(`COL', `FREE1')dnl	 5
PUSHREG(`COL', `FREE2')dnl	 6
PUSHREG(`COL', `FREE3')dnl	 7

PUSHREG(`COL', `MAXSYM')dnl	v8
PUSHREG(`COL', `SCORE')dnl	 9
PUSHREG(`COL', `GHOST0')dnl	 a
PUSHREG(`COL', `GHOST1')dnl	 b

REGS(`MERGE', REGSLVL(`COL'))
PUSHREG(`MERGE', `MASK')

REGS(`SPRITES', 0)
PUSHREG(`SPRITES', `SPMASK')
PUSHREG(`SPRITES', `SPOFF')

REGS(`SPB', 4)
PUSHREG(`SPB', `B0')
PUSHREG(`SPB', `B1')
PUSHREG(`SPB', `B2')
PUSHREG(`SPB', `B3')
PUSHREG(`SPB', `B4')
PUSHREG(`SPB', `B5')
PUSHREG(`SPB', `B6')
PUSHREG(`SPB', `B7')
PUSHREG(`SPB', `SPARE0')
PUSHREG(`SPB', `SPARE0')
PUSHREG(`SPB', `GHOST')

REGS(`DRAW', 0)
PUSHREG(`DRAW', `M0')dnl        v0
PUSHREG(`DRAW', `X0')dnl        v1
PUSHREG(`DRAW', `Y0')dnl        v2
PUSHREG(`DRAW', `M1')dnl        v3
PUSHREG(`DRAW', `X1')dnl        v4
PUSHREG(`DRAW', `Y1')dnl        v5
PUSHREG(`DRAW', `M2')dnl        v6
PUSHREG(`DRAW', `X2')dnl        v7
PUSHREG(`DRAW', `Y2')dnl        v8
PUSHREG(`DRAW', `M3')dnl        v9
PUSHREG(`DRAW', `X3')dnl        vA
PUSHREG(`DRAW', `Y3')dnl        vB
PUSHREG(`DRAW', `DSPOFF')dnl    vC
PUSHREG(`DRAW', `COLOR')dnl     vD

: root
Z := 255
delay := Z
Z := 8
GHOST0 := 0
GHOST1 := 0
S := random 15

: input_loop
_BP(`input_loop')
MEM0 := 5
S := 0
i := board
i += S
save MEM0

: tghosts
:call tgt
i := sym1
sprite X Y 7
:call transform

# `L'
i := bghost0
load MEM0
GHOST := MEM0
v5 := 0
v6 := 0
v7 := 248
:call spb

# `R'
i := bghost1
load MEM0
GHOST := MEM0
v5 := 8
v6 := 0
v7 := 8
:call spb

dnl color the screen - takes about 8 frames
: __bb2
v8 := GHOST
v9 := 16
vb := 16
vd := 16
va :=  0
vc :=  8
ve := 16
i := board0
:call bbc8

i := bghost0
load v0
v8 := v0
v9 := 0
vb := 0
vd := 0
i := board2
:call bbc8
: __bb2_e

: _skip2_prevboard
i := main_regs
load Z
:call key_loop

# patch code based on key press
pushdef(`PATCH', `dnl
i := _$1
i += Z
load MEM1
i := $1
save MEM1
')dnl
PATCH(`transform')
popdef(`PATCH')dnl
i := _tghosts
i += Z
load MEM1
i := tghosts
save MEM1

: _skip0_prevboard
# remove the highlight from the last new sym of the prev board
#sprite OX OY 7
OX := X
OY := Y
OX += 33
OY += 32

i := main_regs
save Z

vd := 0     # black
#i := bghost0
#load SPMASK
#GHOST := SPMASK
#
#DSPOFF := 56
#:call _draw,z,a,p
#
#i := bghost1
#load SPMASK
#GHOST := SPMASK
#
#DSPOFF := 112
#:call _draw,z,b,p
#
#i := main_regs
#load Z
#
## new sym of prev board in reverse video
#i := isym0
#i += KEY
#sprite OX OY 7

: skip0_prevboard

# tuck-away board
i := board
load vf
i := prevboard
save vf

# rot/flip board so pieces fall down
:call transform

MAXSYM := 8
SCORE := 0
MASK := 0xf

:call col
i := board0
save R0
FREE0 := FREE3
GHOST0 := 0xf0
GHOST0 &= GHOST1

i := board1
load R0
:call col
i := board1
save R0
FREE1 := FREE3
GHOST1 &= MASK
GHOST0 |= GHOST1

i := board2
load R0
:call col
i := board2
save R0
FREE2 := FREE3
GHOST := 0xf0
GHOST &= GHOST1
i := board3
load R0
:call col
GHOST1 &= MASK
GHOST1 |= GHOST
i := board3
save SCORE

i := main_regs
load Z

dnl if nothing shifted or merged, then don't add a new sym
MASK := GHOST0
MASK |= GHOST1
if MASK == 0
then jump _skip2_prevboard

#v1 := 0
#if v0 == 1
#then return
#
#i := _urandt
#v0 <<= v0
#i += v0
#load v1
#i := _urandm
#save v0
#
#: _urandl
#0xc0        # opcode for random into v0
#: _urandm
#0           # mask for the opcode
#v0 -= v1
#if vf == 0
#jump _urandl
#
#v0 >>= v0
#v0 >>= v0
#v0 >>= v0
#: _urandt
#v1 := v0

i := sym1
sprite X Y 7
jump input_loop

: _bb2
jump __bb2_e

dnl black on black color routines
pushdef(`M', `dnl
v8 <<= v8
if vf == 0
then jump _bbc8:$*

ifelse($1, 0, `', `v0 := v$1')
:call bbc
: _bbc8:$1
:byte 0xb$2 0x07

: _bbc8:$*
')dnl
: bbc8
load v7
M(0, 9)
M(1, b)
M(2, d)
v1 := v9
v2 := 24
M(3, 1)
v9 += 8
vb += 8
vd += 8
v1 += 8
M(4, 9)
M(5, b)
M(6, d)
M(7, 1)
return
popdef(`M')

: bbc
pushdef(`H', 5)
v0 += 2
if v0 == 2
then return

dnl >>> H = 5
dnl >>> for i in xrange(6):
dnl ...     j = i * H + 60 + 2
dnl ...     k = j - (12 * H + 1 + 2)
dnl ...     l = k & 7
dnl ...     print i, j - 2, k, l
dnl ...
dnl 0 60 -1 7
dnl 1 65 4 4
dnl 2 70 9 1
dnl 3 75 14 6
dnl 4 80 19 3
dnl 5 85 24 0
vf := eval((12 * H) + 1 + 2)
v0 -= vf
if vf != 0
then jump _bbcx

dnl >>> (((6 * H) - (12 * H)) & 255)
dnl 226
dnl >>> for i in xrange(7):
dnl ...     j = i * H + 30 + 2
dnl ...     j = j - (12 * H + 1 + 2)
dnl ...     j &= 255
dnl ...     k = j - (((6 * H) - (12 * H)) & 255)
dnl ...     l = k & 7
dnl ...     print i, i * H + 30, j, k, l
dnl ...
dnl 0 30 225 -1 7
dnl 1 35 230 4 4
dnl 2 40 235 9 1
dnl 3 45 240 14 6
dnl 4 50 245 19 3
dnl 5 55 250 24 0
dnl 6 60 255 29 5
vf := eval(((6 * H) - (12 * H)) & 255)
v0 -= vf
if vf != 0
then jump _bbcx

dnl >>> for i in xrange(7):
dnl ...     j = i * H + 2
dnl ...     j = j - (12 * H + 1 + 2)
dnl ...     j &= 255
dnl ...     j = j - (((6 * H) - (12 * H)) & 255)
dnl ...     j &= 255
dnl ...     k = j + (6 * H)
dnl ...     l = k & 7
dnl ...     print i, i * H, j, k, l
dnl ...
dnl 0 0 225 255 7
dnl 1 5 230 260 4
dnl 2 10 235 265 1
dnl 3 15 240 270 6
dnl 4 20 245 275 3
dnl 5 25 250 280 0
dnl 6 30 255 285 5
v0 += eval(6 * H)

: _bbcx
vf := 7
v0 &= vf
if v0 == 0
then v0 := 7
return
popdef(`H')dnl

: key_loop
Z := 255
delay := Z
Z := 2
: _key_loop_next
if Z key
then return
if Z == 8
then jump key_loop
Z += 2
jump _key_loop_next

: main_regs
0 0 0 0 0
: main_regs_s
0 0 0 0 0

# 11 bytes to invert screen on startup
#: ff11
#255 255 255 255 255 255 255 255 255 255 255

# in case of reset
: reset
i := bghost0
v0 := 0
v1 := 0
save v1

i := sym0
load v3
i := board0
save v3
i := board1
save v3
i := board2
save v3
i := board3
save v3

v0 := 0
v1 := 0
i := sym1
sprite v0 v1 7

v1 := 8
i := sym1
sprite v0 v1 7

v1 := 16
i := sym1
sprite v0 v1 7

v1 := 24
i := sym1
sprite v0 v1 7

v0 := 8
v1 := 0
i := sym1
sprite v0 v1 7

v1 := 8
i := sym1
sprite v0 v1 7

v1 := 16
i := sym1
sprite v0 v1 7

v1 := 24
i := sym1
sprite v0 v1 7

v0 := 16
v1 := 0
i := sym1
sprite v0 v1 7

v1 := 8
i := sym1
sprite v0 v1 7

v1 := 16
i := sym1
sprite v0 v1 7

v1 := 24
i := sym1
sprite v0 v1 7

v0 := 24
v1 := 0
i := sym1
sprite v0 v1 7

v1 := 8
i := sym1
sprite v0 v1 7

v1 := 16
i := sym1
sprite v0 v1 7

v1 := 24
i := sym1
: _urandt
sprite v0 v1 7
return

eval(1 << 3)    0               # 2

eval(3 << 3)    eval(1 << 3)    # 3
eval(3 << 3)    0               # 4

eval(7 << 3)    eval(3 << 3)    # 5
eval(7 << 3)    eval(2 << 3)    # 6
eval(7 << 3)    eval(1 << 3)    # 7
eval(7 << 3)    0               # 8

eval(15 << 3)   eval(7 << 3)    # 9
eval(15 << 3)   eval(6 << 3)    # 10
eval(15 << 3)   eval(5 << 3)    # 11
eval(15 << 3)   eval(4 << 3)    # 12
eval(15 << 3)   eval(3 << 3)    # 13
eval(15 << 3)   eval(2 << 3)    # 14
eval(15 << 3)   eval(1 << 3)    # 15

include(`merge.m')
include(`syms.m')
include(`board.m')
include(`trans.m')
include(`spboard.m')
dnl include(`draw.m')
dnl need some breathing-room for testing
dnl include(`chars.m')
include(`monitors.m')
