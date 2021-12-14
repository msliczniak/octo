# tetrisconcept.net/threads/dr-mario-virus-placement.2037/page-2#post-63038

# SC version

:alias o v8     # old v0
:alias m v9     # mask
:alias s va     # state
:alias x vb
:alias y vc
:alias p vd     # position
:alias t ve     # table

define(`JTE', `0xe00')dnl jump table at 0xe00
define(`LUT', `0xeff')dnl SC off-by-one bug

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

define(`FF',  0)dnl must be zero
define(`FP',  0)dnl
define(`FB',  2)dnl
define(`PF',  8)dnl
define(`PP', 10)dnl
define(`PB', 32)dnl
define(`BF', 34)dnl
define(`BP', 40)dnl
define(`BB', 42)dnl
define(`D', 128)dnl dirty

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

dnl      : bottle0a
dnl 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x50 0xff
dnl      : bottle1a
dnl 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xa0 0xff
dnl      : bottle2a
dnl 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x50 0xff
dnl      : bottle3a
dnl 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xa0 0xff
dnl      : bottle4a
dnl 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x50 0xff
dnl      : bottle5a
dnl 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xa0 0xff
dnl      : bottle6a
dnl 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x50 0xff
dnl      : bottle7a
dnl 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0xa0 0xff

     : bottle0a
0x00 0x50 0xa0 0x50 0xa0 0x50 0xa0 0x50 0xff
     : bottle1a
0x00 0xa0 0x50 0xa0 0x50 0xa0 0x50 0xa0 0xff
     : bottle2a
0x00 0x50 0xa0 0x50 0xa0 0x50 0xa0 0x50 0xff
     : bottle3a
0x00 0xa0 0x50 0xa0 0x50 0xa0 0x50 0xa0 0xff
     : bottle4a
0x00 0x50 0xa0 0x50 0xa0 0x50 0xa0 0x50 0xff
     : bottle5a
0x00 0xa0 0x50 0xa0 0x50 0xa0 0x50 0xa0 0xff
     : bottle6a
0x00 0x50 0xa0 0x50 0xa0 0x50 0xa0 0x50 0xff
     : bottle7a
0x00 0xa0 0x50 0xa0 0x50 0xa0 0x50 0xa0 0xff

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

#:breakpoint bar

v1 := 255
v0 := 1
delay := v0

: start_sync
v0 := delay
if v0 != 0
then jump start_sync

delay := v1
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
v3 := 65
v4 := 0
i := hex v0
sprite v3 v4 5
v3 += 6
i := hex v1
sprite v3 v4 5
v3 += 6
i := hex v2
sprite v3 v4 5

# pause

s := 15
buzzer := s
s := key
clear
jump gen

: p2
v0 := s
i := bottles0
i += p
save v0
i := p2s
load v2
v3 := delay
v3 =- v0
v0 -= v3
v3 &= v2
if x == 0
then v1 += 6
save v1
i := hex v3
sprite v1 x 5

return

: __cas1
s |= vf 
o := v0
p += 1
s <<= s
if vf != 0
then jump __cas2

i := bottles0
i += p
load v1
o := v0
i := LUT
i += v0
load v0
t := v0
jump _cas2

: __cas2
s |= vf
p += 1
s <<= s
if vf != 0
then jump __cas3

i := bottles0
i += p
load v1
o := v0
i := LUT
i += v0
load v0
t := v0
jump _cas3

: __cas3
s |= vf
p += 1
s <<= s
if vf != 0
then jump __cas4

i := bottles0
i += p
load v1
o := v0
i := LUT
i += v0
load v0
t := v0
jump _cas4

: __cas4
s |= vf
p += 1
s <<= s
if vf != 0
then jump __cas5

i := bottles0
i += p
load v1
o := v0
i := LUT
i += v0
load v0
t := v0
jump _cas5

: __cas5
s |= vf
p += 1
s <<= s
if vf != 0
then jump __cas6

i := bottles0
i += p
load v1
o := v0
i := LUT
i += v0
load v0
t := v0
jump _cas6

: __cas6
s |= vf
p += 1
s <<= s
if vf != 0
then jump __cas7

i := bottles0
i += p
load v1
o := v0
i := LUT
i += v0
load v0
t := v0
jump _cas7

: __cas
i := bottle0a
i += p
load v1

: ___cas
i := LUT
i += v1
load v0
t |= v0
jump0 JTE

: _cas
i := bottle0a
i += p
load v1 # load first
s := v0
t := FF # zero

s <<= s
if vf != 0
then jump __cas1

y := 0
:call ___cas

s <<= s
if vf != 0
then jump __cas2

: _cas2
y := 8
:call __cas

s <<= s
if vf != 0
then jump __cas3

: _cas3
y := 8
:call __cas

s <<= s
if vf != 0
then jump __cas4

: _cas4
y := 8
:call __cas

s <<= s
if vf != 0
then jump __cas5

: _cas5
y := 8
:call __cas

s <<= s
if vf != 0
then jump __cas6

: _cas6
y := 8
:call __cas

s <<= s
if vf != 0
then jump __cas7

: _cas7
v0 <<= v0
if v0 == 0
then jump p2

: __cas7
v0 := o
i := bottles0
i += p
save v0

jump p2

: cas
:call _cas
x += 8
:call _cas
x += 8
:call _cas
x += 8
:call _cas
x += 8
:call _cas
x += 8
:call _cas
x += 8
:call _cas
x += 8
:call _cas
p -= 63
x -= 56

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
A(P, Y, P, B) A(P, Y, P, B)
A(P, R, 0, 0) A(P, R, 0, 0)
A(P, R, P, Y) A(P, R, P, Y)
A(P, R, P, R) A(P, R, P, R)
A(P, R, P, B) A(P, R, P, B)
A(P, B, 0, 0) A(P, B, 0, 0)
A(P, B, P, Y) A(P, B, P, Y)
A(P, B, P, R) A(P, B, P, R)
A(P, B, P, B) A(P, B, P, B)

: p2s
255 80 15

dnl : _cas013b
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
dnl : _cas023b
dnl table := PB
dnl v1 &= mask
dnl v8 &= mask
dnl v1 |= v8
dnl v0 <<= v0
dnl v0 &= mask
dnl return

:org 0xd2a      # SC off-by-one bug
: _dcai
: _casi
t >>= t
t &= m
s >>= s
return

: _dca013b
: _cas013b
: _dca023b
: _cas023b
: _dca02b3
: _cas02b3
: _dca02bb
: _cas02bb
: _dca03bb
: _cas03bb
: _dca123b
: _cas123b
: _dca12b3
: _cas12b3
: _dca12bb
: _cas12bb
: _dca13bb
: _cas13bb
: _dca1b23
: _cas1b23
: _dca1b2b
: _cas1b2b
: _dca1bb3
: _cas1bb3
: _dca1bbb
: _cas1bbb
: _dca2bb3
: _cas2bb3
: _dca2bbb
: _cas2bbb
: _dcab13b
: _casb13b
: _dcab3bb
: _casb3bb
: _dca23bb
: _cas23bb
v0 := v1
v1 := 0
i += p
save v1

v8 := 0

i := _spr23bb
i += v0
sprite x y 15

t >>= t
t &= m
return

:org JTE
jump _dcai    # 0123
jump _dcai    # 012b
jump _dcai    # 0123
jump _dcai    # 0123
jump _dcai    # 012b
jump _dcai    # 01b3
jump _dca013b # 01b3
jump _dcai    # 01bb
jump _dcai    # 0b23
jump _dcai    # 0b2b
jump _dca02b3 # 0b23
jump _dca023b # 0b23
jump _dca02bb # 0b2b
jump _dcai    # 0bb3
jump _dca03bb # 0bb3
jump _dcai    # 0bbb
jump _dcai    # 0123
jump _dcai    # 012b
jump _dcai    # 0123
jump _dcai    # 0123
jump _dcai    # 012b
jump _dcai    # 01b3
jump _dca013b # 01b3
jump _dcai    # 01bb
jump _dcai    # 0123
jump _dcai    # 012b
jump _dcai    # 0123
jump _dcai    # 0123
jump _dcai    # 012b
jump _dcai    # 01b3
jump _dca013b # 01b3
jump _dcai    # 01bb
jump _dcai    # 0b23
jump _dcai    # 0b2b
jump _dca02b3 # 0b23
jump _dca023b # 0b23
jump _dca02bb # 0b2b
jump _dcai    # 0bb3
jump _dca03bb # 0bb3
jump _dcai    # 0bbb
jump _dcai    # b123
jump _dcai    # b12b
jump _dcai    # b123
jump _dcai    # b123
jump _dcai    # b12b
jump _dcai    # b1b3
jump _dcab13b # b1b3
jump _dcai    # b1bb
jump _dca1b23 # b123
jump _dca1b2b # b12b
jump _dca12b3 # b123
jump _dca123b # b123
jump _dca12bb # b12b
jump _dca1bb3 # b1b3
jump _dca13bb # b1b3
jump _dca1bbb # b1bb
jump _dcai    # bb23
jump _dcai    # bb2b
jump _dca2bb3 # bb23
jump _dca23bb # bb23
jump _dca2bbb # bb2b
jump _dcai    # bbb3
jump _dcab3bb # bbb3
jump _dcai    # bbbb

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
