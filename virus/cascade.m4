# tetrisconcept.net/threads/dr-mario-virus-placement.2037/page-2#post-63038

# SC version

:alias m v8
:alias s v9
:alias x vA
:alias y vB
:alias pos vC

: main
jump init

# VIRUS 2P 000000
0x56
0x49
0x52
0x55
0x53
0x20
0x32
0x50
0x20
0x30
0x30
0x30
0x30
0x30
0x30
0

: virus_level_tbl
0x9 0x9 0x9 0x9 0x9 0x9 0x9
0x9 0x9 0x9 0x9 0x9 0x9 0x9
0x9 0xA 0xA 0xB 0xB 0xC 0xC
0xC 0xC 0xC 0xC 0xC 0xC 0xC
0xC 0xC 0xC 0xC 0xC 0xC 0xC

: virus_pos_tbl
0x78 0x70 0x68 0x60 0x58 0x50 0x48 0x40
0x38 0x30 0x28 0x20 0x18 0x10 0x08 0x00

: bit_tbl
1 2 4 0

: virus_type_tbl
0 1 2 2 1 0 0 1 2 2 1 0 0 1 2 1

: bottles
0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xfc

     : bottle0a
0xcf 0x00 0x3c 0x3c 0x3c 0x3c 0x3c 0x3c 0x1c
     : bottle1a
0xcf 0x08 0x3c 0x3c 0x3c 0x3c 0x3c 0x3c 0x3c
     : bottle2a
0xcf 0x10 0x3c 0x3c 0x3c 0x3c 0x3c 0x3c 0x3c
     : bottle3a
0xcf 0x18 0x3c 0x3c 0x3c 0x3c 0x3c 0x3c 0x3c
     : bottle4a
0xcf 0x20 0x3c 0x3c 0x3c 0x3c 0x3c 0x3c 0x3c
     : bottle5a
0xcf 0x28 0x3c 0x3c 0x3c 0x3c 0x3c 0x3c 0x3c
     : bottle6a
0xcf 0x30 0x3c 0x3c 0x3c 0x3c 0x3c 0x3c 0x3c
     : bottle7a
0xcf 0x0c 0x3c 0x3c 0x3c 0x3c 0x3c 0x3c 0x3b

0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xfc

: bottle0b
0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xfc
: bottle1b
0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xfc
: bottle2b
0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xfc
: bottle3b
0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xfc
: bottle4b
0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xfc
: bottle5b
0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xfc
: bottle6b
0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xfc
: bottle7b
0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xfc

0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xfc

: dots
0x80 0x00 0x00 0x00 0x80 0x00 0x00 0x00 0x80 0x00 0x00 0x00 0x80

:org 0x400

# % printf '%s\n' {x..z}{x..z} | tr 'xyz' 'FPB' | nl -v-1
#     -1	FF
#      0	FP
#      1	FB
#      2	PF
#      3	PP
#      4	PB
#      5	BF
#      6	BP
#      7	BB
# % printf '%02x\n' 0 2 8 10 32 34 40 42 | xxd -r -p | xxd -b -c1
# 00000000: 00000000  .
# 00000001: 00000010  .
# 00000002: 00001000  .
# 00000003: 00001010  .
# 00000004: 00100000
# 00000005: 00100010  "
# 00000006: 00101000  (
# 00000007: 00101010  *

define(`FF',  0)dnl
define(`FP',  0)dnl
define(`FB',  2)dnl
define(`PF',  8)dnl
define(`PP', 10)dnl
define(`PB', 32)dnl
define(`BF', 34)dnl
define(`BP', 40)dnl
define(`BB', 42)dnl

: luta
BB
BB
BB
BB
BB
BB
BB
BB
BB
BB
BB
BB
BB
BB
BB
BB
BP
BF
BP
BF
BF
BF
BF
BF
BP
BF
BP
BF
BF
BF
BF
BF
PB
PB
FB
FB
PB
PB
FB
FB
FB
FB
FB
FB
FB
FB
FB
FB
PP
PF
FP
FF
PF
PF
FF
FF
FP
FF
FP
FF
FF
FF
FF
FF
BP
BF
BP
BF
BF
BF
BF
BF
BP
BF
BP
BF
BF
BF
BF
BF
BP
BF
BP
BF
BF
BF
BF
BF
BP
BF
BP
BF
BF
BF
BF
BF
PP
PF
FP
FF
PF
PF
FF
FF
FP
FF
FP
FF
FF
FF
FF
FF
PP
PF
FP
FF
PF
PF
FF
FF
FP
FF
FP
FF
FF
FF
FF
FF
PB
PB
FB
FB
PB
PB
FB
FB
FB
FB
FB
FB
FB
FB
FB
FB
PP
PF
FP
FF
PF
PF
FF
FF
FP
FF
FP
FF
FF
FF
FF
FF
PB
PB
FB
FB
PB
PB
FB
FB
FB
FB
FB
FB
FB
FB
FB
FB
PP
PF
FP
FF
PF
PF
FF
FF
FP
FF
FP
FF
FF
FF
FF
FF
PP
PF
FP
FF
PF
PF
FF
FF
FP
FF
FP
FF
FF
FF
FF
FF
PP
PF
FP
FF
PF
PF
FF
FF
FP
FF
FP
FF
FF
FF
FF
FF
PP
PF
FP
FF
PF
PF
FF
FF
FP
FF
FP
FF
FF
FF
FF
FF
PP
PF
FP
FF
PF
PF
FF
FF
FP
FF
FP
FF
FF
FF
FF
FF

: init
#:breakpoint init
hires

: gen

i := dots
v0 := 0
v1 := 63
v2 := 127
v3 := 4
v4 := 20
v5 := 36
v6 := 52

sprite v0 v3 13
sprite v1 v3 13
sprite v2 v3 13

sprite v0 v4 13
sprite v1 v4 13
sprite v2 v4 13

sprite v0 v5 13
sprite v1 v5 13
sprite v2 v5 13

sprite v0 v6 9
sprite v1 v6 9
sprite v2 v6 9

#:breakpoint baz

pos := 1
x := 0
y := 1
v1 := 0x18

: fill
i := bottle0a
i += pos
load v0

v2 := v0
v2 >>= v2
v2 &= v1
if v2 == 0x18
then jump filla

i := array
i += v2
sprite x y 3

: filla
y += 4

v2 := v0
v2 <<= v2
v2 &= v1
if v2 == 0x18
then jump fillb

i := array
i += v2
sprite x y 3

: fillb
y += 4
pos += 1

if y != 65
then jump fill

if x == 56
then jump filled

x += 8
pos += 1
y := 1
jump fill

: filled

i := array
ve := 64
vf := 1
sprite ve vf 3

:breakpoint bar

v0 := 255
delay := v0

x := 0
y := 57
pos := 1
m := 0x18
: call cascade

v1 := delay
v0 := 255
v0 -= v1
i := digits
bcd v0
i := digits
load v2
v3 := 72
v4 := 0
i := bighex v0
sprite v3 v4 10
v3 += 9
i := bighex v1
sprite v3 v4 10
v3 += 9
i := bighex v2
sprite v3 v4 10

# pause

s := 15
buzzer := s
s := key
clear
jump gen

define(`CASCADE',`dnl
: cascade_loop`'$1
# indicate one col done
i := array
ve := 64
vf := 1
sprite ve vf 7

i := bottle0a
i += pos
load v`'$1

:call cascade`'$1

i := bottle0a
i += pos
save v`'$1

s := 56
s &= x
if s == 56
then jump cascade_done`'$1

pos += 9
x += 8
#y += 56
y := 57
jump cascade_loop`'$1

: cascade_done`'$1')dnl

: cascade
CASCADE(7)
x -= 56
#y += 56
#pos -= 62
y := 57
pos := 2

CASCADE(6)
x -= 56
#y += 48
#pos -= 61
y := 57
pos := 3

CASCADE(5)
x -= 56
#y += 40
#pos -= 60
y := 57
pos := 4

CASCADE(4)
x -= 56
#y += 32
#pos -= 59
y := 57
pos := 5

CASCADE(3)
x -= 56
#y += 24
#pos -= 58
y := 57
pos := 6

CASCADE(2)
x -= 56
#y += 16
#pos -= 57
y := 57
pos := 7

CASCADE(1)
x -= 56
#y += 8
#pos -= 56
y := 57
pos := 8

CASCADE(0)
return

undefine(`CASCADE')dnl
define(`CASCADE',`dnl
: cascade`'$1
y -= 8')dnl

CASCADE(7)
CASCADE(6)
CASCADE(5)
CASCADE(4)
CASCADE(3)
CASCADE(2)
CASCADE(1)
CASCADE(0)
return

:monitor bottles 180

: digits
0 0 0

define(`P', `56')dnl
define(`Y', `124')dnl
define(`R', `108')dnl
define(`B', `68')dnl
define(`A', `$1 $2 $1 0 $3 $4 $3 0')dnl

: array
A(P, Y, P, Y)
A(P, R, P, R)
A(P, B, P, B)
