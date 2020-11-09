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
: root
Z := 8
OX := 56
OY := 33

: input_loop
KEY := key

KEY <<= KEY
i := keytable
i += KEY
load MEM1
i := input_loop_trampoline0
save MEM1

: input_loop_trampoline0
jump input_loop_trampoline0

: keytable
jump handle_key0
jump handle_key1
jump handle_key2
jump handle_key3
jump handle_key4
jump handle_key5
jump handle_key6
jump handle_key7
jump handle_key8
jump handle_key9
jump handle_keya
jump handle_keyb
jump handle_keyc
jump handle_keyd
jump handle_keye
jump handle_keyf

: handle_key0
X := 8
Y := 25
S := 7
jump input_loop0

: handle_key1
X := 0
Y := 1
S := 0
jump input_loop0

: handle_key2
X := 8
Y := 1
S := 4
jump input_loop0

: handle_key3
X := 16
Y := 1
S := 8
jump input_loop0

: handle_key4
X := 0
Y := 9
S := 1
jump input_loop0

: handle_key5
X := 8
Y := 9
S := 5
jump input_loop0

: handle_key6
X := 16
Y := 9
S := 9
jump input_loop0

: handle_key7
X := 0
Y := 17
S := 2
jump input_loop0

: handle_key8
X := 8
Y := 17
S := 6
jump input_loop0

: handle_key9
X := 16
Y := 17
S := 10
jump input_loop0

: handle_keya
X := 0
Y := 25
S := 3
jump input_loop0

: handle_keyb
X := 16
Y := 25
S := 11
jump input_loop0

: handle_keyc
X := 24
Y := 1
S := 12
jump input_loop0

: handle_keyd
X := 24
Y := 9
S := 13
jump input_loop0

: handle_keye
X := 24
Y := 17
S := 14
jump input_loop0

: handle_keyf
X := 24
Y := 25
S := 15
# FALLTHRU

: input_loop0
i := board
i += S
load MEM0
if MEM0 != BL
then jump input_loop

# highlight the picked cell
i := isym0
sprite X Y 5

# multiply by five
KEY := key
KEY += 1
M := KEY
KEY <<= KEY
KEY <<= KEY
KEY += M

# draw the new sym
i := sym0
i += KEY
sprite X Y 5

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

# remove the highlight from the new sym
i := isym0
sprite X Y 5

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
_BP(`input_loop')

REGS(`COL', 0)
PUSHREG(`COL', `R3')
PUSHREG(`COL', `R2')
PUSHREG(`COL', `R1')
PUSHREG(`COL', `R0')

PUSHREG(`COL', `FREE0')
PUSHREG(`COL', `FREE1')
PUSHREG(`COL', `FREE2')
PUSHREG(`COL', `FREE3')

PUSHREG(`COL', `MAXSYM')
PUSHREG(`COL', `SCORE')
PUSHREG(`COL', `GHOST0')
PUSHREG(`COL', `GHOST1')

REGS(`MERGE', REGSLVL(`COL'))
PUSHREG(`MERGE', `MASK')

REGS(`SPRITES', 0)
PUSHREG(`SPRITES', `SPMASK')
PUSHREG(`SPRITES', `SPOFF')

REGS(`SPB', 6)
PUSHREG(`SPB', `B0')
PUSHREG(`SPB', `B1')
PUSHREG(`SPB', `B2')
PUSHREG(`SPB', `B3')
PUSHREG(`SPB', `B4')
PUSHREG(`SPB', `B5')
PUSHREG(`SPB', `B6')
PUSHREG(`SPB', `B7')
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
PUSHREG(`DRAW', `COLOR')dnl     vC
PUSHREG(`DRAW', `DSPOFF')dnl    vD

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
MEM0 := KEY
i := board
i += S
save MEM0

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

: tghosts
:call tgt
:call transform

# `L'
i := bghost0
load MEM0
GHOST := MEM0

# `L' sprite ghost
vf := 56
i := prevboard0-6
:call spb,z

# `L' draw  ghost
DSPOFF := 56
:call _draw,z,a

# `R'
i := bghost1
load MEM0
GHOST := MEM0

# `R' sprite ghost
vf := 112
i := prevboard2-6
:call spb,z

# `R' draw  ghost
DSPOFF := 112
:call _draw,z,b

# `R' sprite new
vf := 0
i := board2-6
:call spb,z

# `R' draw  new
DSPOFF := 0
:call _draw,z,b

# `L'
i := bghost0
load MEM0
GHOST := MEM0

# `L' sprite new
vf := 0
i := board0-6
:call spb,z

# `L' draw  new
DSPOFF := 0
:call _draw,z,a

dnl color the screen
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
v8 := 56

: _clear_board_sprites
v8 -= 14
i := sprite:0:1
i += v8
save v4
i := sprite:1:1
i += v8
save v4
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

return

include(`merge.m')
include(`syms.m')
include(`board.m')
include(`trans.m')
include(`spboard.m')
include(`draw.m')
dnl need some breathing-room for testing
dnl include(`chars.m')
include(`monitors.m')
