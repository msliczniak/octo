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

:breakpoint input_loop

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
MASK := 0xf

:call col
i := board0
save R0
FREE0 := FREE3
GHOST := 0xf0
GHOST &= GHOST1

i := board1
load R0
:call col
i := board1
save R0
FREE1 := FREE3
GHOST0 &= MASK
GHOST0 |= GHOST

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

POPREGS(`MERGE', 0)
DELREGS(`MERGE')

ve := GHOST0
i := prevboard0-6
load vd
v0 := 3
v0 &= ve

if v0 == 0
then jump draw2

i := sym0
v0 >>= v0
if vf != 0
then jump fill0
load v6
i := sprite0
save v6

: draw1
i := sym0
v0 := 2
v0 &= ve
if v0 != 0
then jump fill1
load v6
i := sprite0
save v6

: draw2

clear

jump input_loop

: fill0
i := isym0
i += v6
jump draw1

: fill1
i := isym0
i += v7
jump draw2

include(`merge.m')
POPREGS(`COL', 0)
DELREGS(`COL')

popdef(`X')
popdef(`KEY')
POPREGS(`MAIN', 0)
DELREGS(`MAIN')

include(`syms.m')
include(`board.m')
include(`chars.m')
include(`monitors.m')
