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

:call drawaz
:call drawbz
:call drawazp
:call drawbzp

dnl Z is the orientation
dnl
dnl 0 |   2       4 |     6
dnl   |    -----    |      -----
dnl   |/       /   \|      \
dnl
REGS(`MAIN', 0)
PUSHREG(`MAIN', `MEM0')
PUSHREG(`MAIN', `MEM1')
PUSHREG(`MAIN', `Y')
PUSHREG(`MAIN', `Z')
PUSHREG(`MAIN', `S')
PUSHREG(`MAIN', `M')
PUSHREG(`MAIN', `OX')
PUSHREG(`MAIN', `OY')
pushdef(`KEY', `MEM0`'')
pushdef(`X',   `MEM1`'')
Z := 0
OX := vd
OY := vc

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

:call key_loop

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
save v7

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
PUSHREG(`MERGE', `GHOST')
PUSHREG(`MERGE', `MASK')

dnl POPREGS(`MERGE', 0)
dnl DELREGS(`MERGE')

REGS(`SPRITES', 0)
PUSHREG(`SPRITES', `SPMASK')

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
PUSHREG(`DRAW', `M0')
PUSHREG(`DRAW', `X0')
PUSHREG(`DRAW', `Y0')
PUSHREG(`DRAW', `M1')
PUSHREG(`DRAW', `X1')
PUSHREG(`DRAW', `Y1')
PUSHREG(`DRAW', `M2')
PUSHREG(`DRAW', `X2')
PUSHREG(`DRAW', `Y2')
PUSHREG(`DRAW', `M3')
PUSHREG(`DRAW', `X3')
PUSHREG(`DRAW', `Y3')

i := bghost0
load SPMASK
GHOST := SPMASK

i := prevboard0-6
:call spbz
:call drawazp

i := board0-6
:call spbz
:call drawazp

i := bghost1
load SPMASK
GHOST := SPMASK
i := prevboard2-6
:call spbz
:call drawbzp

i := board2-6
:call spbz
:call drawbzp

i := main_regs
load v7

# new sym of prev board in reverse video
i := isym0
i += KEY
sprite OX OY 7

i := board
i += S
save KEY

# pressed direction key
M -= 8

M += Z
S := 7
M &= S

if M == 2
then jump left

if M == 4
then jump flip

if M == 6
then jump right

# save board state
i := board
load vf
i := prevboard
save vf

: proceed

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
i := prevboard0-6
:call spbz
:call drawaz

i := board0-6
:call spbz
:call drawaz

i := bghost1
load SPMASK
GHOST := SPMASK
i := prevboard2-6
:call spbz
:call drawbz

i := board2-6
:call spbz
:call drawbz

i := main_regs
load v7
jump input_loop

: key_loop
M := 2
: _key_loop_next
if M key
then return
if M == 8
then jump key_loop
M += 2
jump _key_loop_next

: spbzt
jump spb0
jump spb2
jump spb4
jump spb6

: spbz
load B7
: _spbzt
jump spb0

: idraws0
i := drawbs0
: idraws1
i := drawbs1
: idrawe0
i := drawbe0
: idrawe1
i := drawbe1
: idraws0p
i := drawbs0p
: idraws1p
i := drawbs1p
: idrawe0p
i := drawbe0p
: idrawe1p
i := drawbe1p

: drawaz
i := drawbs0
load Y3
jump draw

: drawbz
i := drawbs1
load Y3
jump draw

: drawazp
i := drawbs0p
load Y3
jump draw

: drawbzp
i := drawbs1p
load Y3
jump draw

: munge
i := _spbzt
i += Z
load MEM1
i := spbz
save MEM1

if Z == 4
then jump kn

if Z != 0
then return

i := idraws0
load MEM1
i := drawaz
save MEM1

i := idraws1
load MEM1
i := drawbz
save MEM1

i := idraws0p
load MEM1
i := drawazp
save MEM1

i := idraws1p
load MEM1
i := drawbzp
save MEM1

return

: kn
i := idraws1
load MEM1
i := drawaz
save MEM1

i := idraws0
load MEM1
i := drawbz
save MEM1

i := idraws1p
load MEM1
i := drawazp
save MEM1

i := idraws0p
load MEM1
i := drawbzp
save MEM1

return

# 11 bytes to invert screen on startup
: main_regs
255 255 255 255 255 255 255 255 255 255 255

include(`merge.m')
POPREGS(`COL', 0)
DELREGS(`COL')

popdef(`X')
popdef(`KEY')
POPREGS(`MAIN', 0)
DELREGS(`MAIN')

include(`syms.m')
include(`board.m')
include(`trans.m')
include(`spboard.m')
include(`draw.m')
include(`chars.m')
include(`monitors.m')
