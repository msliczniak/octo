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
Y := 24
S := 7
jump input_loop0

: handle_key1
X := 0
Y := 0
S := 0
jump input_loop0

: handle_key2
X := 8
Y := 0
S := 4
jump input_loop0

: handle_key3
X := 16
Y := 0
S := 8
jump input_loop0

: handle_key4
X := 0
Y := 8
S := 1
jump input_loop0

: handle_key5
X := 8
Y := 8
S := 5
jump input_loop0

: handle_key6
X := 16
Y := 8
S := 9
jump input_loop0

: handle_key7
X := 0
Y := 16
S := 2
jump input_loop0

: handle_key8
X := 8
Y := 16
S := 6
jump input_loop0

: handle_key9
X := 16
Y := 16
S := 10
jump input_loop0

: handle_keya
X := 0
Y := 24
S := 3
jump input_loop0

: handle_keyb
X := 16
Y := 24
S := 11
jump input_loop0

: handle_keyc
X := 24
Y := 0
S := 12
jump input_loop0

: handle_keyd
X := 24
Y := 8
S := 13
jump input_loop0

: handle_keye
X := 24
Y := 16
S := 14
jump input_loop0

: handle_keyf
X := 24
Y := 24
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
sprite X Y 7 

# multiply by seven
KEY := key
KEY += 1
M := KEY
KEY <<= KEY
KEY <<= KEY
KEY <<= KEY
KEY -= M

# draw the new sym
i := sym0
i += KEY
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

# remove the highlight from the new sym
i := isym0
sprite X Y 7

: _skip0_prevboard
# remove the highlight from the last new sym of the prev board
sprite OX OY 7
OX := X
OY := Y
OX += 33
OY += 32

i := main_regs
save Z

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

i := bghost0
load SPMASK
GHOST := SPMASK

DSPOFF := 60
:call _draw,z,a,p

i := bghost1
load SPMASK
GHOST := SPMASK

DSPOFF := 120
:call _draw,z,b,p

i := main_regs
load Z

# new sym of prev board in reverse video
i := isym0
i += KEY
sprite OX OY 7

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

REGS(`XSP', 0)
PUSHREG(`XSP', `A0')
PUSHREG(`XSP', `A1')
PUSHREG(`XSP', `A2')
PUSHREG(`XSP', `A3')
PUSHREG(`XSP', `A4')
PUSHREG(`XSP', `A5')
PUSHREG(`XSP', `A6')
PUSHREG(`XSP', `B0')
PUSHREG(`XSP', `B1')
PUSHREG(`XSP', `B2')
PUSHREG(`XSP', `B3')
PUSHREG(`XSP', `B4')
PUSHREG(`XSP', `B5')
PUSHREG(`XSP', `B6')

pushdef(`M', `dnl
A0 := eval(3 << (6 - ($2 * 2)))
A0 &= GHOST
if A0 == 0
then jump $*

i := sprite:decr($3)
vf := eval($2 * 15)
:call _xorsp
i := sprite:$3
save A6

i := sprite:incr($3):-7
vf := eval(($2 * 15) + 8)
:call _xorsp
i := sprite:incr($3)
save A6

: $*
')dnl

divert(incr(divnum))dnl

: _xorsp
load B6
i := sprite:0
i += vf
load A6

A0 ^= B0
A1 ^= B1
A2 ^= B2
A3 ^= B3
A4 ^= B4
A5 ^= B5
A6 ^= B6

return
divert(decr(divnum))dnl

# `L'
i := bghost0
load MEM0
GHOST := MEM0

# `L' sprite ghost
vf := 60
i := prevboard0-6
:call spb,z

# `L' draw  ghost
DSPOFF := 60
:call _draw,z,a

# `R'
i := bghost1
load MEM0
GHOST := MEM0

# `R' sprite ghost
vf := 120
i := prevboard2-6
:call spb,z

# `R' draw  ghost
DSPOFF := 120
:call _draw,z,b

# `R' sprite new
vf := 0
i := board2-6
:call spb,z

: _skip1_prevboard
# `R' sprite xor
M(`_xorsp', `0', `16')
M(`_xorsp', `1', `18')
M(`_xorsp', `2', `20')
M(`_xorsp', `3', `22')
: skip1_prevboard

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

: _skip2_prevboard
# `L' sprite xor
M(`_xorsp', `0', `8')
M(`_xorsp', `1', `10')
M(`_xorsp', `2', `12')
M(`_xorsp', `3', `14')
: skip2_prevboard

i := main_regs
load Z
jump input_loop

popdef(`M')
POPREGS(`XSP', 0)
DELREGS(`XSP')

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

DRAW(`z', `a', `p')
DRAW(`z', `b', `p')

popdef(`DRAW')

: main_regs
0 0 0 0 0 0 0 0 0 0

# 11 bytes to invert screen on startup
: ff11
255 255 255 255 255 255 255 255 255 255 255

# in case of reset
: reset
clear

i := bghost0
v0 := 0
v1 := 0
save v1

i := isym0
load v6
v7 := 0
v8 := 60

: _clear_board_sprites
v8 -= 15
i := sprite:0
i += v8
save v7
i := sprite:1
i += v8
save v6
if v8 != 0
then jump _clear_board_sprites

i := sym0
load v6
i := board0
save v7
i := board2
save v7

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
