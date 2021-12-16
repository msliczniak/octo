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
define(`LUT', `eval(256*15 - 1)')dnl SC off-by-one bug

# q  ^  0
# r  |  1
# s  |  2
# t  |  3
#
# D  st qr st - qr st qr  0
# Cr Cq Cr Cq - Tr Tq Tr Tq
# Ct Cs Ct Cs - Tt Ts Tt Ts

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
#  % printf '%02x\n' 0 4 16 20 64 68 80 84 | xxd -r -p | xxd -b -c1
# 00000000: 00000000  .
# 00000001: 00000100  .
# 00000002: 00010000  .
# 00000003: 00010100  .
# 00000004: 01000000  @
# 00000005: 01000100  D
# 00000006: 01010000  P
# 00000007: 01010100  T

define(`FF',  0)dnl must be zero
define(`FP',  0)dnl
define(`FB',  4)dnl
define(`PF', 16)dnl
define(`PP', 20)dnl
define(`PB', 64)dnl
define(`BF', 68)dnl
define(`BP', 80)dnl
define(`BB', 84)dnl
define(`D', `eval(($1)| 128)')dnl dirty

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

# 0x30 0x60 0x70 0x90 0xb0 0xc0 0xd0 0xe0 0xf0

     : bottle0a
0x00 0x00 0x30 0x60 0x70 0x90 0xb0 0xc0 0xd0
     : bottle1a
0x00 0x00 0xe0 0xf0 0x30 0x60 0x70 0x90 0xb0
     : bottle2a
0x00 0x00 0xc0 0xd0 0xe0 0xf0 0x30 0x60 0x70
     : bottle3a
0x00 0x00 0x90 0xb0 0xc0 0xd0 0xe0 0xf0 0x30
     : bottle4a
0x00 0x00 0x60 0x70 0x90 0xb0 0xc0 0xd0 0xe0
     : bottle5a
0x00 0x00 0xf0 0x30 0x60 0x70 0x90 0xb0 0xc0
     : bottle6a
0x00 0x00 0xd0 0xe0 0xf0 0x30 0x60 0x70 0x90
     : bottle7a
0x00 0x00 0xb0 0xc0 0xd0 0xe0 0xf0 0x30 0x60
     
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

p := 1
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

:breakpoint bar

v1 := 255
v0 := 1
delay := v0

: start_sync
v0 := delay
if v0 != 0
then jump start_sync

delay := v1
x := 0
p := 0
m := 0xaa
:call cas

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
p += 1
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

: __cas
i := bottle0a
i += p
load v1
i := LUT
i += v1
load v0
t |= v0
jump0 JTE

: _cas
t := FF # zero
y := 248
:call __cas
y := 0
:call __cas
y := 8
:call __cas
y := 16
:call __cas
y := 24
:call __cas
y := 32
:call __cas
y := 40
:call __cas
y := 48
:call __cas
t <<= t
if vf == 0
then jump p2

v0 := o
i := bottle0a
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
A(0, 0, 0, 0) A(0, 0, 0, 0)     # 0000 E E
A(P, Y, 0, 0) A(P, Y, 0, 0)     # 0001 Y E
A(0, 0, P, Y) A(0, 0, P, Y)     # 0010 E Y
A(P, Y, P, Y) A(P, Y, P, Y)     # 0011 Y Y
A(P, R, 0, 0) A(P, R, 0, 0)     # 0100 R E
A(P, B, 0, 0) A(P, B, 0, 0)     # 0101 B E
A(P, R, P, Y) A(P, R, P, Y)     # 0110 R Y
A(P, B, P, Y) A(P, B, P, Y)     # 0111 B Y
A(0, 0, P, R) A(0, 0, P, R)     # 1000 E R
A(P, Y, P, R) A(P, Y, P, R)     # 1001 Y R
A(0, 0, P, B) A(0, 0, P, B)     # 1010 E B
A(P, Y, P, B) A(P, Y, P, B)     # 1011 Y B
A(P, R, P, R) A(P, R, P, R)     # 1100 R R
A(P, B, P, R) A(P, B, P, R)     # 1101 B R
A(P, R, P, B) A(P, R, P, B)     # 1110 R B
A(P, B, P, B) A(P, B, P, B)     # 1111 B B

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

:org 0xd54      # SC off-by-one bug

: _dcai
v0 := o
i := bottle0a
i += p
save v0

: _casi
o := v1
t >>= t
t &= m
p += 1
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
i := bottle0a
i += p
save v0

i := _spr23bb
i += v0
sprite x y 15

t := D(BB >> 1)
p += 1
return

:org JTE
jump _casi    # 0123
jump _casi    # 0b23
jump _casi    # 012b
jump _casi    # 0b2b
jump _casi    # 0123
jump _casi    # 0123
jump _casi    # 012b
jump _casi    # 012b
jump _casi    # 0123
jump _cas02b3 # 0b23
jump _casi    # 0123
jump _cas023b # 0b23
jump _casi    # 0123
jump _casi    # 0123
jump _casi    # 0123
jump _casi    # 0123
jump _casi    # 0b23
jump _casi    # b123
jump _casi    # 0b2b
jump _casi    # b12b
jump _cas1b23 # b123
jump _casi    # bb23
jump _cas1b2b # b12b
jump _casi    # bb2b
jump _cas02b3 # 0b23
jump _casi    # b123
jump _cas023b # 0b23
jump _casi    # b123
jump _cas12b3 # b123
jump _cas2bb3 # bb23
jump _cas123b # b123
jump _cas23bb # bb23
jump _casi    # 012b
jump _cas02bb # 0b2b
jump _casi    # 01b3
jump _casi    # 0bb3
jump _casi    # 012b
jump _casi    # 012b
jump _casi    # 01b3
jump _casi    # 01b3
jump _cas013b # 01b3
jump _cas03bb # 0bb3
jump _casi    # 01bb
jump _casi    # 0bbb
jump _cas013b # 01b3
jump _cas013b # 01b3
jump _casi    # 01bb
jump _casi    # 01bb
jump _cas02bb # 0b2b
jump _casi    # b12b
jump _casi    # 0bb3
jump _casi    # b1b3
jump _cas12bb # b12b
jump _cas2bbb # bb2b
jump _cas1bb3 # b1b3
jump _casi    # bbb3
jump _cas03bb # 0bb3
jump _casb13b # b1b3
jump _casi    # 0bbb
jump _casi    # b1bb
jump _cas13bb # b1b3
jump _casb3bb # bbb3
jump _cas1bbb # b1bb
jump _casi    # bbbb
jump _dcai    # 0123
jump _dcai    # 0b23
jump _dcai    # 012b
jump _dcai    # 0b2b
jump _dcai    # 0123
jump _dcai    # 0123
jump _dcai    # 012b
jump _dcai    # 012b
jump _dcai    # 0123
jump _dca02b3 # 0b23
jump _dcai    # 0123
jump _dca023b # 0b23
jump _dcai    # 0123
jump _dcai    # 0123
jump _dcai    # 0123
jump _dcai    # 0123
jump _dcai    # 0b23
jump _dcai    # b123
jump _dcai    # 0b2b
jump _dcai    # b12b
jump _dca1b23 # b123
jump _dcai    # bb23
jump _dca1b2b # b12b
jump _dcai    # bb2b
jump _dca02b3 # 0b23
jump _dcai    # b123
jump _dca023b # 0b23
jump _dcai    # b123
jump _dca12b3 # b123
jump _dca2bb3 # bb23
jump _dca123b # b123
jump _dca23bb # bb23
jump _dcai    # 012b
jump _dca02bb # 0b2b
jump _dcai    # 01b3
jump _dcai    # 0bb3
jump _dcai    # 012b
jump _dcai    # 012b
jump _dcai    # 01b3
jump _dcai    # 01b3
jump _dca013b # 01b3
jump _dca03bb # 0bb3
jump _dcai    # 01bb
jump _dcai    # 0bbb
jump _dca013b # 01b3
jump _dca013b # 01b3
jump _dcai    # 01bb
jump _dcai    # 01bb
jump _dca02bb # 0b2b
jump _dcai    # b12b
jump _dcai    # 0bb3
jump _dcai    # b1b3
jump _dca12bb # b12b
jump _dca2bbb # bb2b
jump _dca1bb3 # b1b3
jump _dcai    # bbb3
jump _dca03bb # 0bb3
jump _dcab13b # b1b3
jump _dcai    # 0bbb
jump _dcai    # b1bb
jump _dca13bb # b1b3
jump _dcab3bb # bbb3
jump _dca1bbb # b1bb
jump _dcai    # bbbb

# SC off-by-one bug
# :org eval(LUT + 0) :byte BB
:org eval(LUT + 16) :byte PB
:org eval(LUT + 17) :byte FB
:org eval(LUT + 20) :byte FB
:org eval(LUT + 21) :byte FB
:org eval(LUT + 32) :byte BP
:org eval(LUT + 34) :byte BF
:org eval(LUT + 40) :byte BF
:org eval(LUT + 42) :byte BF
:org eval(LUT + 48) :byte PP
:org eval(LUT + 49) :byte FP
:org eval(LUT + 50) :byte PF
:org eval(LUT + 51) :byte FF
:org eval(LUT + 52) :byte FP
:org eval(LUT + 53) :byte FP
:org eval(LUT + 54) :byte FF
:org eval(LUT + 55) :byte FF
:org eval(LUT + 56) :byte PF
:org eval(LUT + 57) :byte FF
:org eval(LUT + 58) :byte PF
:org eval(LUT + 59) :byte FF
:org eval(LUT + 60) :byte FF
:org eval(LUT + 61) :byte FF
:org eval(LUT + 62) :byte FF
:org eval(LUT + 63) :byte FF
:org eval(LUT + 64) :byte PB
:org eval(LUT + 65) :byte FB
:org eval(LUT + 68) :byte FB
:org eval(LUT + 69) :byte FB
:org eval(LUT + 80) :byte PB
:org eval(LUT + 81) :byte FB
:org eval(LUT + 84) :byte FB
:org eval(LUT + 85) :byte FB
:org eval(LUT + 96) :byte PP
:org eval(LUT + 97) :byte FP
:org eval(LUT + 98) :byte PF
:org eval(LUT + 99) :byte FF
:org eval(LUT + 100) :byte FP
:org eval(LUT + 101) :byte FP
:org eval(LUT + 102) :byte FF
:org eval(LUT + 103) :byte FF
:org eval(LUT + 104) :byte PF
:org eval(LUT + 105) :byte FF
:org eval(LUT + 106) :byte PF
:org eval(LUT + 107) :byte FF
:org eval(LUT + 108) :byte FF
:org eval(LUT + 109) :byte FF
:org eval(LUT + 110) :byte FF
:org eval(LUT + 111) :byte FF
:org eval(LUT + 112) :byte PP
:org eval(LUT + 113) :byte FP
:org eval(LUT + 114) :byte PF
:org eval(LUT + 115) :byte FF
:org eval(LUT + 116) :byte FP
:org eval(LUT + 117) :byte FP
:org eval(LUT + 118) :byte FF
:org eval(LUT + 119) :byte FF
:org eval(LUT + 120) :byte PF
:org eval(LUT + 121) :byte FF
:org eval(LUT + 122) :byte PF
:org eval(LUT + 123) :byte FF
:org eval(LUT + 124) :byte FF
:org eval(LUT + 125) :byte FF
:org eval(LUT + 126) :byte FF
:org eval(LUT + 127) :byte FF
:org eval(LUT + 128) :byte BP
:org eval(LUT + 130) :byte BF
:org eval(LUT + 136) :byte BF
:org eval(LUT + 138) :byte BF
:org eval(LUT + 144) :byte PP
:org eval(LUT + 145) :byte FP
:org eval(LUT + 146) :byte PF
:org eval(LUT + 147) :byte FF
:org eval(LUT + 148) :byte FP
:org eval(LUT + 149) :byte FP
:org eval(LUT + 150) :byte FF
:org eval(LUT + 151) :byte FF
:org eval(LUT + 152) :byte PF
:org eval(LUT + 153) :byte FF
:org eval(LUT + 154) :byte PF
:org eval(LUT + 155) :byte FF
:org eval(LUT + 156) :byte FF
:org eval(LUT + 157) :byte FF
:org eval(LUT + 158) :byte FF
:org eval(LUT + 159) :byte FF
:org eval(LUT + 160) :byte BP
:org eval(LUT + 162) :byte BF
:org eval(LUT + 168) :byte BF
:org eval(LUT + 170) :byte BF
:org eval(LUT + 176) :byte PP
:org eval(LUT + 177) :byte FP
:org eval(LUT + 178) :byte PF
:org eval(LUT + 179) :byte FF
:org eval(LUT + 180) :byte FP
:org eval(LUT + 181) :byte FP
:org eval(LUT + 182) :byte FF
:org eval(LUT + 183) :byte FF
:org eval(LUT + 184) :byte PF
:org eval(LUT + 185) :byte FF
:org eval(LUT + 186) :byte PF
:org eval(LUT + 187) :byte FF
:org eval(LUT + 188) :byte FF
:org eval(LUT + 189) :byte FF
:org eval(LUT + 190) :byte FF
:org eval(LUT + 191) :byte FF
:org eval(LUT + 192) :byte PP
:org eval(LUT + 193) :byte FP
:org eval(LUT + 194) :byte PF
:org eval(LUT + 195) :byte FF
:org eval(LUT + 196) :byte FP
:org eval(LUT + 197) :byte FP
:org eval(LUT + 198) :byte FF
:org eval(LUT + 199) :byte FF
:org eval(LUT + 200) :byte PF
:org eval(LUT + 201) :byte FF
:org eval(LUT + 202) :byte PF
:org eval(LUT + 203) :byte FF
:org eval(LUT + 204) :byte FF
:org eval(LUT + 205) :byte FF
:org eval(LUT + 206) :byte FF
:org eval(LUT + 207) :byte FF
:org eval(LUT + 208) :byte PP
:org eval(LUT + 209) :byte FP
:org eval(LUT + 210) :byte PF
:org eval(LUT + 211) :byte FF
:org eval(LUT + 212) :byte FP
:org eval(LUT + 213) :byte FP
:org eval(LUT + 214) :byte FF
:org eval(LUT + 215) :byte FF
:org eval(LUT + 216) :byte PF
:org eval(LUT + 217) :byte FF
:org eval(LUT + 218) :byte PF
:org eval(LUT + 219) :byte FF
:org eval(LUT + 220) :byte FF
:org eval(LUT + 221) :byte FF
:org eval(LUT + 222) :byte FF
:org eval(LUT + 223) :byte FF
:org eval(LUT + 224) :byte PP
:org eval(LUT + 225) :byte FP
:org eval(LUT + 226) :byte PF
:org eval(LUT + 227) :byte FF
:org eval(LUT + 228) :byte FP
:org eval(LUT + 229) :byte FP
:org eval(LUT + 230) :byte FF
:org eval(LUT + 231) :byte FF
:org eval(LUT + 232) :byte PF
:org eval(LUT + 233) :byte FF
:org eval(LUT + 234) :byte PF
:org eval(LUT + 235) :byte FF
:org eval(LUT + 236) :byte FF
:org eval(LUT + 237) :byte FF
:org eval(LUT + 238) :byte FF
:org eval(LUT + 239) :byte FF
:org eval(LUT + 240) :byte PP
:org eval(LUT + 241) :byte FP
:org eval(LUT + 242) :byte PF
:org eval(LUT + 243) :byte FF
:org eval(LUT + 244) :byte FP
:org eval(LUT + 245) :byte FP
:org eval(LUT + 246) :byte FF
:org eval(LUT + 247) :byte FF
:org eval(LUT + 248) :byte PF
:org eval(LUT + 249) :byte FF
:org eval(LUT + 250) :byte PF
:org eval(LUT + 251) :byte FF
:org eval(LUT + 252) :byte FF
:org eval(LUT + 253) :byte FF
:org eval(LUT + 254) :byte FF
:org eval(LUT + 255) :byte FF
