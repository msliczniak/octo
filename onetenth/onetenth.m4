include(`defines.m')

REGS(`MAIN', 0)
PUSHREG(`MAIN', `MEM0')
PUSHREG(`MAIN', `MEM1')
PUSHREG(`MAIN', `Y')
PUSHREG(`MAIN', `Z')
PUSHREG(`MAIN', `S')
PUSHREG(`MAIN', `M')
pushdef(`KEY', `MEM0`'')
pushdef(`X',   `MEM1`'')

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
X := 10
Y := 24
S := 7
jump input_loop0

: handle_key1
X := 0
Y := 0
S := 0
jump input_loop0

: handle_key2
X := 10
Y := 0
S := 4
jump input_loop0

: handle_key3
X := 20
Y := 0
S := 8
jump input_loop0

: handle_key4
X := 0
Y := 8
S := 1
jump input_loop0

: handle_key5
X := 10
Y := 8
S := 5
jump input_loop0

: handle_key6
X := 20
Y := 8
S := 9
jump input_loop0

: handle_key7
X := 0
Y := 16
S := 2
jump input_loop0

: handle_key8
X := 10
Y := 16
S := 6
jump input_loop0

: handle_key9
X := 20
Y := 16
S := 10
jump input_loop0

: handle_keya
X := 0
Y := 24
S := 3
jump input_loop0

: handle_keyb
X := 20
Y := 24
S := 11
jump input_loop0

: handle_keyc
X := 30
Y := 0
S := 12
jump input_loop0

: handle_keyd
X := 30
Y := 8
S := 13
jump input_loop0

: handle_keye
X := 30
Y := 16
S := 14
jump input_loop0

: handle_keyf
X := 30
Y := 24
S := 15
# FALLTHRU

: input_loop0
i := isym0
sprite X Y 7 

KEY := key
KEY += 1
KEY <<= KEY
KEY <<= KEY
KEY <<= KEY
i := board
i += S
save MEM0

i := isym0
i += MEM0
sprite X Y 7

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

# save board state
i := board
load vf
i := prevboard
save vf

MAXSYM := 8
SCORE := 0
MASK := 0xf0

:call col
i := board0
save R0
FREE0 := FREE3
GHOST0 := 0xf
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
GHOST := 0xf
GHOST &= GHOST1

i := board3
load R0
:call col
GHOST1 &= MASK
GHOST1 |= GHOST
i := board3
save SCORE

POPREGS(`MERGE', 0)
DELREGS(`MERGE')

REGS(`SPRITES', 0)
PUSHREG(`SPRITES', `MASK')

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

GHOST := GHOST0
i := prevboard0-6
load B7
:call spbv

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

i := drawbs0
load Y3
:call draw

i := board0-6
load B7
:call spbv

i := drawbs0
load Y3
:call draw



i := bghost1
load MASK
GHOST := MASK
i := prevboard2-6
load B7
:call spbv

i := drawbs1
load Y3
:call draw

i := board2-6
load B7
:call spbv

i := drawbs1
load Y3
:call draw



# KEY := key
# clear

jump input_loop

include(`merge.m')
POPREGS(`COL', 0)
DELREGS(`COL')

popdef(`X')
popdef(`KEY')
POPREGS(`MAIN', 0)
DELREGS(`MAIN')

include(`syms.m')
include(`board.m')
include(`spboard.m')
include(`draw.m')
include(`chars.m')
include(`monitors.m')
