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
PUSHREG(`MAIN', `X')
PUSHREG(`MAIN', `Y')
PUSHREG(`MAIN', `S')
PUSHREG(`MAIN', `M')
PUSHREG(`MAIN', `OX')
PUSHREG(`MAIN', `OY')
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
MEM0 := 5

: input_loop
_BP(`input_loop')
i := board
i += S
save MEM0

S <<= S
i := _ghost_magic_table
i += S
load MEM1
i := _ghost_magic
save MEM1

0x60
: _ghost_magic
0 0
1

: tghosts
:call tgt
:call transform

# `L'
i := bghost0
load MEM0
GHOST := MEM0

# `L' sprite new
vf := 0
i := board0:-4
:call spb,z

# `L' sprite ghost
vf := 56
i := prevboard0:-4
:call spb,z

# `L' draw  ghost
DSPOFF := 56
:call _draw,z,a

# # `L' sprite xor
# DSPOFF := 56
# :call xorsp

# `R'
i := bghost1
load MEM0
GHOST := MEM0

# `R' sprite ghost
vf := 112
i := prevboard2:-4
:call spb,z

# `R' draw  ghost
DSPOFF := 112
:call _draw,z,b

# `R' sprite new
vf := 112
i := board2:-4
:call spb,z

# `R' draw  new
DSPOFF := 112
:call _draw,z,b

# # `R' draw  xor
# DSPOFF := 112
# :call xorsp
# DSPOFF := 112
# :call _draw,z,b

# `L'
i := bghost0
load MEM0
GHOST := MEM0

# `L' draw  new
DSPOFF := 0
:call _draw,z,a

# # `L' draw  xor
# DSPOFF := 56
# :call _draw,z,a

# runtime
MEM0 := 255
Z := delay
MEM0 -= Z
divert(incr(divnum))dnl
: bcd0
:byte 0
: bcd1
:byte 0
: bcd2
:byte 0
divert(decr(divnum))dnl
i := bcd0
bcd MEM0
MEM1 := 8
i := bcd0
load MEM0
i := hex MEM0
MEM0 := 40
sprite MEM0 MEM1 5
i := bcd1
load MEM0
i := hex MEM0
MEM0 := 46
sprite MEM0 MEM1 5
i := bcd2
load MEM0
i := hex MEM0
MEM0 := 52
sprite MEM0 MEM1 5

dnl color the screen - takes about 8 frames
: __bb2
v8 := GHOST
va := 0x10
vc := 0x12
ve := 0x14
v9 := 0
vb := 0
vd := 0
i := board0
:call bbc8

i := bghost1
load v0
v8 := v0
v9 := 2
vb := 2
vd := 2
i := board2
:call bbc8

: _skip2_prevboard
i := main_regs
load Z

: __bb0     # show prevboard
vd := 7     # white
ve := 0x34  # h: start at region 4 and color 3 + 1 regions
vf := 0x70  # v: start at region 0 and color 7 + 1 regions
0xbe 0xd0

: _bb0

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

S >>= S
S >>= S
S >>= S

MEM0 := 5

jump input_loop

: _bb2
jump _skip2_prevboard

dnl black on black color routines
pushdef(`M', `dnl
v8 <<= v8
if vf == 0
then jump _bbc8:$*

ifelse($1, 0, `', `v0 := v$1')
:call bbc
0xb$2 0

: _bbc8:$*
')dnl
: bbc8
load v7
M(0, 9)
M(1, b)
M(2, d)
v1 := v9
v2 := 0x16
M(3, 1)
v9 += 1
vb += 1
vd += 1
v1 += 1
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
Z := 2
: _key_loop_next
if Z key
then return
if Z == 8
then jump key_loop
Z += 2
jump _key_loop_next

pushdef(`DRAW', `dnl
: _draw,$*
i := draw,$*
load Y3
jump draw
')dnl

DRAW(`z', `a')
DRAW(`z', `b')

#DRAW(`z', `a', `p')
#DRAW(`z', `b', `p')

popdef(`DRAW')

: main_regs
0 0 0 0 0 0 0 0 0 0

# 11 bytes to invert screen on startup
#: ff11
#255 255 255 255 255 255 255 255 255 255 255

# in case of reset
: reset
clear

i := bghost0
v0 := 0
v1 := 0
save v1

i := isym0
load v4
v5 := v0
v6 := v0
v8 := 56

: _clear_board_sprites
v8 -= 14
i := sprite:0
i += v8
save v6
i := sprite:1
i += v8
save v6
if v8 != 0
then jump _clear_board_sprites

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

GHOST := 0xff
DSPOFF := 0
 i := draw,z,a
 load vb
:call draw
 i := draw,z,b
 load vb
:call draw

v0 := 0
i := sprite:8
: _urandt
save v0
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

REGS(`XSP', 0)
PUSHREG(`XSP', `A0')    # v0
PUSHREG(`XSP', `A1')    #  1
PUSHREG(`XSP', `A2')    #  2
PUSHREG(`XSP', `A3')    #  3
PUSHREG(`XSP', `A4')    #  4
PUSHREG(`XSP', `B0')    # v5
PUSHREG(`XSP', `B1')    #  6
PUSHREG(`XSP', `B2')    #  7
PUSHREG(`XSP', `B3')    #  8
PUSHREG(`XSP', `B4')    #  9
PUSHREG(`XSP', `XAOFF') # va
PUSHREG(`XSP', `XBOFF') #  b
divert(incr(divnum))dnl
: _xorsp
load B4
i := sprite:8:1
i += XBOFF
load A4

A0 ^= B0
A1 ^= B1
A2 ^= B2
A3 ^= B3
A4 ^= B4
i := sprite:8:1
i += XBOFF
save A4
return

: xorsp
XAOFF := 0
XBOFF := DSPOFF
XBOFF -= 56
COLOR := GHOST
i := sprite:0:-4

: _xorspl
COLOR <<= COLOR
if vf == 1
then jump _xorsp1

COLOR <<= COLOR
if vf == 1
then jump _xorsp0

XAOFF += 8
XBOFF += 8
jump _xorspc

: _xorsp1
COLOR <<= COLOR

# FALLTHRU
: _xorsp0
:call _xorsp
XAOFF += 8
XBOFF += 8
i := sprite:0:-4
i += XAOFF
:call _xorsp

: _xorspc
if COLOR == 0
then return

XAOFF += 6
XBOFF += 6
i := sprite:0:-4
i += XAOFF
jump _xorspl
divert(decr(divnum))dnl
POPREGS(`XSP', 0)
DELREGS(`XSP')

: _ghost_magic_table
:byte 0x80 0x8a
:byte 0x40 0x8a
:byte 0x20 0x8a
:byte 0x10 0x8a
:byte 0x08 0x8a
:byte 0x04 0x8a
:byte 0x02 0x8a
:byte 0x01 0x8a
:byte 0x80 0x8b
:byte 0x40 0x8b
:byte 0x20 0x8b
:byte 0x10 0x8b
:byte 0x08 0x8b
:byte 0x04 0x8b
:byte 0x02 0x8b
:byte 0x01 0x8b

include(`merge.m')
include(`syms.m')
include(`board.m')
include(`trans.m')
include(`spboard.m')
include(`draw.m')
dnl need some breathing-room for testing
dnl include(`chars.m')
include(`monitors.m')
