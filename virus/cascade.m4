# tetrisconcept.net/threads/dr-mario-virus-placement.2037/page-2#post-63038

# SC version

:alias m v9     # mask
:alias s va     # state
:alias x vb
:alias y vc
:alias p vd     # position
:alias t ve     # table

define(`JT8', `0xe80')dnl 0x80 offest jump table
define(`LUT', `0xeff')dnl SC off-by-one bug

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
: bottles0
0xff
: bottles1
0xff
: bottles2
0xff
: bottles3
0xff
: bottles4
0xff
: bottles5
0xff
: bottles6
0xff
: bottles7
0xff
: bottles8
0xff

     : bottle0a
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x10 0xff
     : bottle1a
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x20 0xff
     : bottle2a
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x30 0xff
     : bottle3a
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x40 0xff
     : bottle4a
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x50 0xff
     : bottle5a
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x60 0xff
     : bottle6a
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x70 0xff
     : bottle7a
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x80 0xff

0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff

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

: init
#:breakpoint init
hires

: gen

i := dots
v0 := 0
v1 := 63
v2 := 127
v3 := 3
v4 := 19
v5 := 35
v6 := 51

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

p := 0
x := 0
y := 0

: fill
i := bottle0a
i += p
load v0

if v0 == 0
then jump filla

i := _spr23bb
i += v0
sprite x y 7

: filla
y += 8
p += 1

if y != 64
then jump fill

if x == 56
then jump filled

x += 8
p += 1
y := 0
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
p := 9
m := 0xaa
: call cas

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

: _cas
i := LUT
i += v1
load v0
t |= v0
jump0 JT8

# indicate one col done
: p2
i := array
ve := 64
vf := 1
sprite ve vf 7
return

: _cas7
i := bottles0
i += p
load v7
i := LUT
i += v0
v8 := v0
load v0
t := v0

i := bottles0
t <<= t
y := 0
:call _cas

i := bottles1
v1 := v2
y := 8
:call _cas

i := bottles2
v1 := v3
y := 16
:call _cas

i := bottles3
v1 := v4
y := 24
:call _cas

i := bottles4
v1 := v5
y := 32
:call _cas

i := bottles5
v1 := v6
y := 40
:call _cas

i := bottles6
v1 := v7
y := 48
:call _cas

jump p2

: _cas6
i := bottles0
i += p
load v6
i := LUT
i += v0
v8 := v0
load v0
t := v0

i := bottles0
t <<= t
y := 0
:call _cas

i := bottles1
v1 := v2
y := 8
:call _cas

i := bottles2
v1 := v3
y := 16
:call _cas

i := bottles3
v1 := v4
y := 24
:call _cas

i := bottles4
v1 := v5
y := 32
:call _cas

i := bottles5
v1 := v6
y := 40
:call _cas

jump p2

: _cas5
i := bottles0
i += p
load v5
i := LUT
i += v0
v8 := v0
load v0
t := v0

i := bottles0
t <<= t
y := 0
:call _cas

i := bottles1
v1 := v2
y := 8
:call _cas

i := bottles2
v1 := v3
y := 16
:call _cas

i := bottles3
v1 := v4
y := 24
:call _cas

i := bottles4
v1 := v5
y := 32
:call _cas

jump p2

: _cas4
i := bottles0
i += p
load v4
i := LUT
i += v0
v8 := v0
load v0
t := v0

i := bottles0
t <<= t
y := 0
:call _cas

i := bottles1
v1 := v2
y := 8
:call _cas

i := bottles2
v1 := v3
y := 16
:call _cas

i := bottles3
v1 := v4
y := 24
:call _cas

jump p2

: _cas3
i := bottles0
i += p
load v3
i := LUT
i += v0
v8 := v0
load v0
t := v0

i := bottles0
t <<= t
y := 0
:call _cas

i := bottles1
v1 := v2
y := 8
:call _cas

i := bottles2
v1 := v3
y := 16
:call _cas

jump p2

: _cas2
i := bottles0
i += p
load v2
i := LUT
i += v0
v8 := v0
load v0
t := v0

i := bottles0
t <<= t
y := 0
:call _cas

i := bottles1
v1 := v2
y := 8
:call _cas

jump p2

: _cas1
i := bottles0
i += p
load v1
i := LUT
i += v0
v8 := v0
load v0
t := v0

i := bottles0
t <<= t
y := 0
:call _cas

jump p2

: cas
:call _cas7
p += 9
x += 8
:call _cas7
p += 9
x += 8
:call _cas7
p += 9
x += 8
:call _cas7
p += 9
x += 8
:call _cas7
p += 9
x += 8
:call _cas7
p += 9
x += 8
:call _cas7
p += 9
x += 8
:call _cas7
p -= 63
x -= 56

:call _cas6
p += 9
x += 8
:call _cas6
p += 9
x += 8
:call _cas6
p += 9
x += 8
:call _cas6
p += 9
x += 8
:call _cas6
p += 9
x += 8
:call _cas6
p += 9
x += 8
:call _cas6
p += 9
x += 8
:call _cas6
p -= 63
x -= 56

:call _cas5
p += 9
x += 8
:call _cas5
p += 9
x += 8
:call _cas5
p += 9
x += 8
:call _cas5
p += 9
x += 8
:call _cas5
p += 9
x += 8
:call _cas5
p += 9
x += 8
:call _cas5
p += 9
x += 8
:call _cas5
p -= 63
x -= 56

:call _cas4
p += 9
x += 8
:call _cas4
p += 9
x += 8
:call _cas4
p += 9
x += 8
:call _cas4
p += 9
x += 8
:call _cas4
p += 9
x += 8
:call _cas4
p += 9
x += 8
:call _cas4
p += 9
x += 8
:call _cas4
p -= 63
x -= 56

:call _cas3
p += 9
x += 8
:call _cas3
p += 9
x += 8
:call _cas3
p += 9
x += 8
:call _cas3
p += 9
x += 8
:call _cas3
p += 9
x += 8
:call _cas3
p += 9
x += 8
:call _cas3
p += 9
x += 8
:call _cas3
p -= 63
x -= 56

:call _cas2
p += 9
x += 8
:call _cas2
p += 9
x += 8
:call _cas2
p += 9
x += 8
:call _cas2
p += 9
x += 8
:call _cas2
p += 9
x += 8
:call _cas2
p += 9
x += 8
:call _cas2
p += 9
x += 8
:call _cas2
p -= 63
x -= 56

:call _cas1
p += 9
x += 8
:call _cas1
p += 9
x += 8
:call _cas1
p += 9
x += 8
:call _cas1
p += 9
x += 8
:call _cas1
p += 9
x += 8
:call _cas1
p += 9
x += 8
:call _cas1
p += 9
x += 8
:call _cas1

return

:monitor bottles 180

: digits
0 0 0

define(`P', `56')dnl
define(`Y', `124')dnl
define(`R', `108')dnl
define(`B', `68')dnl
define(`A', `$1 $2 $1 0 $3 $4 $3 0')dnl

: _spr23bb
A(0, 0, 0, 0) A(0, 0, 0, 0)
A(0, 0, P, Y) A(0, 0, P, Y)
A(0, 0, P, R) A(0, 0, P, R)
A(0, 0, P, B) A(0, 0, P, B)
A(P, Y, 0, 0) A(P, Y, 0, 0)
A(P, Y, P, Y) A(P, Y, P, Y)
A(P, Y, P, R) A(P, Y, P, R)
: array
A(P, Y, P, B) A(P, Y, P, B)
A(P, R, 0, 0) A(P, R, 0, 0)
A(P, R, P, Y) A(P, R, P, Y)
A(P, R, P, R) A(P, R, P, R)
A(P, R, P, B) A(P, R, P, B)
A(P, B, 0, 0) A(P, B, 0, 0)
A(P, B, P, Y) A(P, B, P, Y)
A(P, B, P, R) A(P, B, P, R)
A(P, B, P, B) A(P, B, P, B)

: _cas013b
dnl table := PB
dnl v1 <<= v1
dnl v1 &= mask
dnl v0 := v8
dnl save v1
dnl v8 := v1
dnl i := _s013b
dnl i += v1
dnl y += 8
dnl sprite x y 7
dnl return
dnl 
: _cas023b
dnl table := PB
dnl v1 &= mask
dnl v8 &= mask
dnl v1 |= v8
dnl v0 <<= v0
dnl v0 &= mask
dnl return

: _cas02b3
: _cas02bb
: _cas03bb
: _cas123b
: _cas12b3
: _cas12bb
: _cas13bb
: _cas1b23
: _cas1b2b
: _cas1bb3
: _cas1bbb
: _cas2bb3
: _cas2bbb
: _casb13b
: _casb3bb

:org 0xe2a      # SC off-by-one bug
: _casi
t >>= t
t &= m
s >>= s
return

: _cas23bb
v0 := v1
v1 := 0
save v1

v8 := 0

i := _spr23bb
i += v0
sprite x y 15

t >>= t
t &= m
return

:org JT8
jump _casi    # 0123
jump _casi    # 012b
jump _casi    # 0123
jump _casi    # 0123
jump _casi    # 012b
jump _casi    # 01b3
jump _cas013b # 01b3
jump _casi    # 01bb
jump _casi    # 0b23
jump _casi    # 0b2b
jump _cas02b3 # 0b23
jump _cas023b # 0b23
jump _cas02bb # 0b2b
jump _casi    # 0bb3
jump _cas03bb # 0bb3
jump _casi    # 0bbb
jump _casi    # 0123
jump _casi    # 012b
jump _casi    # 0123
jump _casi    # 0123
jump _casi    # 012b
jump _casi    # 01b3
jump _cas013b # 01b3
jump _casi    # 01bb
jump _casi    # 0123
jump _casi    # 012b
jump _casi    # 0123
jump _casi    # 0123
jump _casi    # 012b
jump _casi    # 01b3
jump _cas013b # 01b3
jump _casi    # 01bb
jump _casi    # 0b23
jump _casi    # 0b2b
jump _cas02b3 # 0b23
jump _cas023b # 0b23
jump _cas02bb # 0b2b
jump _casi    # 0bb3
jump _cas03bb # 0bb3
jump _casi    # 0bbb
jump _casi    # b123
jump _casi    # b12b
jump _casi    # b123
jump _casi    # b123
jump _casi    # b12b
jump _casi    # b1b3
jump _casb13b # b1b3
jump _casi    # b1bb
jump _cas1b23 # b123
jump _cas1b2b # b12b
jump _cas12b3 # b123
jump _cas123b # b123
jump _cas12bb # b12b
jump _cas1bb3 # b1b3
jump _cas13bb # b1b3
jump _cas1bbb # b1bb
jump _casi    # bb23
jump _casi    # bb2b
jump _cas2bb3 # bb23
jump _cas23bb # bb23
jump _cas2bbb # bb2b
jump _casi    # bbb3
jump _casb3bb # bbb3
jump _casi    # bbbb

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

# BB SC off-by-one bug
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
