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
MEM0 := 6
S := 0
i := board
i += S
save MEM0

: tghosts
:call tgt
:call transform

# `L'
i := bghost0
load MEM0
v1 := 0
v2 := 1
v4 := 25
v5 := 0
:call spb

# `R'
i := bghost1
load MEM0
v8 := MEM0
v1 := 16
v2 := 1
v5 := 8
:call spb

dnl color the screen
if v8 == 0
then jump _skip_first_ghost

v9 := 16
vb := 16
vd := 16
va :=  0
vc :=  8
ve := 16
i := board2
:call bbc8

i := bghost0
load v0
if v0 == 0
then jump _skip2_prevboard

: _do_second_ghost
v8 := v0
v9 := 0
vb := 0
vd := 0
i := board0
:call bbc8

: _skip2_prevboard
i := main_regs
load Z

vd := 4
: _color :byte 0xb7 0xd7
i := hsym1
sprite X Y 7
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
#i := hisym0
#sprite OX OY 7
OX := X
OY := Y
OX += 32
OY += 33

i := main_regs
save Z

# `L'
i := bghost0
load MEM0
v1 := 32
v2 := 162
v4 := 186
v5 := 0
:call spb

# `R'
i := bghost1
load MEM0
v8 := MEM0
v1 := 48
v2 := 162
v5 := 8
:call spb

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

# new sym of prev board in reverse video
i := hisym1
sprite OX OY 7

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

i := hisym1
sprite X Y 7
jump input_loop

: _skip_first_ghost
i := bghost0
load v0
if v0 == 0
then jump _skip2_prevboard

va :=  0
vc :=  8
ve := 16
jump _do_second_ghost

dnl black on black color routines
pushdef(`M', `dnl
v8 <<= v8
if vf == 0
then jump _bbc8:$*

i := symc
i += v$1
load v0

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

# in case of reset
: reset
i := bghost0
v0 := 0
v1 := 0
save v1

v0 := 0
v1 := 0
v2 := 0
v3 := 0
i := board0
save v3
i := board1
save v3
i := board2
save v3
i := board3
save v3

i := isym0
v1 := 0

: _resetbv
v0 := 0

: _resetb
sprite v0 v1 4
v1 += 4
sprite v0 v1 3
v1 -= 4
if v0 == 24
then jump _resetbh

v0 += 8
jump _resetb

: _resetbh
if v1 == 24
then jump _resetbe

v1 += 8
jump _resetbv

: _resetbe
v1 := 161

: _resetpv
v0 := 32

: _resetp
sprite v0 v1 4
v1 += 4
sprite v0 v1 3
v1 -= 4
if v0 == 56
then jump _resetph

v0 += 8
jump _resetp

: _resetph
if v1 == 185
then return

v1 += 8
jump _resetpv

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
dnl need some breathing-room for testing
dnl include(`chars.m')
include(`monitors.m')
