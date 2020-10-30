include(`defines.m')
clear   # in case of reset

i := main_regs
vd := 32
vc := 32
vb := 43
va := 54

: invert_loop
sprite vd vc 11
sprite vd vb 11
sprite vd va 10
if vd == 56
then jump inverted
vd += 8
jump invert_loop

: inverted
i := isym0
vc += 1 # gives a nice box effect
sprite vd vc 7

load v6
i := sprite0
save v6
i := sprite1
save v6
i := sprite2
save v6
i := sprite3
save v6
i := sprite4
save v6
i := sprite5
save v6
i := sprite6
save v6
i := sprite7
save v6
ve := 0xff

vd := 0
 i := draw,s,a
 load vb
:call draw
 i := draw,s,b
 load vb
:call draw
 i := draw,s,a,p
 load vb
:call draw
 i := draw,s,b,p
 load vb
:call draw

dnl Z is the orientation
dnl
dnl 8 |   6       2 /|   4 
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

# highlight the picked cell
: input_loop0
i := isym0
sprite X Y 7 

KEY := key
KEY += 1
KEY <<= KEY
KEY <<= KEY
KEY <<= KEY

# draw the new sym
i := sym0
i += KEY
sprite X Y 7

# Z is conveniently both the key and orientation
:call key_loop

# patch code based on key press
pushdef(`PATCH', `dnl
i := _$1
i += Z
load MEM1
i := $1
save MEM1
')

PATCH(`transform')
PATCH(`draw,z,a')
PATCH(`draw,z,a,p')
PATCH(`draw,z,b')
PATCH(`draw,z,b,p')

popdef(`PATCH')

# remove the highlight from the new sym
i := isym0
sprite X Y 7

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

PUSHREG(`COL', `GHOST0')
PUSHREG(`COL', `GHOST1')
PUSHREG(`COL', `MAXSYM')
PUSHREG(`COL', `SCORE')

REGS(`MERGE', REGSLVL(`COL'))
dnl PUSHREG(`MERGE', `GHOST')
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
PUSHREG(`DRAW', `M0')dnl v0
PUSHREG(`DRAW', `X0')dnl v1
PUSHREG(`DRAW', `Y0')dnl v2
PUSHREG(`DRAW', `M1')dnl v3
PUSHREG(`DRAW', `X1')dnl v4
PUSHREG(`DRAW', `Y1')dnl v5
PUSHREG(`DRAW', `M2')dnl v6
PUSHREG(`DRAW', `X2')dnl v7
PUSHREG(`DRAW', `Y2')dnl v8
PUSHREG(`DRAW', `M3')dnl v9
PUSHREG(`DRAW', `X3')dnl vA
PUSHREG(`DRAW', `Y3')dnl vB
PUSHREG(`DRAW', `COLOR')dnl vC
PUSHREG(`DRAW', `DSPOFF')dnl vD

i := bghost0
load SPMASK
GHOST := SPMASK

vf := 0
i := prevboard0-6
:call draw,z,a,p

vf := 0
i := board0-6
:call draw,z,a,p

i := bghost1
load SPMASK
GHOST := SPMASK

vf := 0
i := prevboard2-6
:call draw,z,b,p

vf := 0
i := board2-6
:call draw,z,b,p

i := main_regs
load Z

# new sym of prev board in reverse video
i := isym0
i += KEY
sprite OX OY 7

MEM0 := KEY
i := board
i += S
save MEM0

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

GHOST := GHOST0
vf := 0
i := prevboard0-6
:call draw,z,a

vf := 0
i := board0-6
:call draw,z,a

i := bghost1
load SPMASK
GHOST := SPMASK
vf := 0
i := prevboard2-6
:call draw,z,b

vf := 0
i := board2-6
:call draw,z,b

i := main_regs
load Z
jump input_loop

: key_loop
Z := 2
: _key_loop_next
if Z key
then return
if Z == 8
then jump key_loop
Z += 2
jump _key_loop_next

: transform
: _transform
jump ts     # up is convenietly 2, the same length as this one instruction

jump tn
jump tw
jump te
jump ts

pushdef(`DRAW', `dnl
: _draw,$*
:call spb,$1
i := draw,$*
load Y3
jump draw
')

DRAW(`n', `a')
DRAW(`n', `a', `p')
DRAW(`n', `b')
DRAW(`n', `b', `p')

DRAW(`w', `a')
DRAW(`w', `a', `p')
DRAW(`w', `b')
DRAW(`w', `b', `p')

DRAW(`e', `a')
DRAW(`e', `a', `p')
DRAW(`e', `b')
DRAW(`e', `b', `p')

DRAW(`s', `a')
DRAW(`s', `a', `p')
DRAW(`s', `b')
DRAW(`s', `b', `p')

popdef(`DRAW')

pushdef(`DRAW', `dnl
: draw,z,$*
: _draw,z,$*
jump _draw,s,$*

jump _draw,n,$*
jump _draw,w,$*
jump _draw,e,$*
jump _draw,s,$*
')

DRAW(`a')
DRAW(`a', `p')
DRAW(`b')
DRAW(`b', `p')

popdef(`DRAW')

# 11 bytes to invert screen on startup
: main_regs
255 255 255 255 255 255 255 255 255 255 255

include(`merge.m')
POPREGS(`COL', 0)
DELREGS(`COL')

POPREGS(`MAIN', 0)
DELREGS(`MAIN')

include(`syms.m')
include(`board.m')
include(`trans.m')
include(`spboard.m')
include(`draw.m')
dnl need some breathing-room for testing
dnl include(`chars.m')
include(`monitors.m')
