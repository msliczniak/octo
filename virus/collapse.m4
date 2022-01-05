# tetrisconcept.net/threads/dr-mario-virus-placement.2037/page-2#post-63038

# SC version

:alias c v7     # col state
:alias o v8     # old v0
:alias m v9     # mask
:alias s va     # state
:alias x vb
:alias j vc
:alias p vd     # position
:alias t ve     # table

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
#0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01
#0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01
#0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01
#0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01
#0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01
#0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01 0x00 0x01
#0x00 0x01 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
#0x01 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00

0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x01
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x01
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x01
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x01
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00

: dots
0x80 0x00 0x00 0x00 0x80 0x00 0x00 0x00 0x80 0x00 0x00 0x00 0x80

: init
#:breakpoint init
hires

: gen

i := dots
v0 := 0
#v1 := 63
v1 := 0
#v2 := 127
v2 := 0
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
j := 0

: fill
i := bottles
i += p
load v0

if v0 == 0
then jump filla

i := _spr
i += v0
sprite x j 3

: filla
j += 4
p += 1

if j != 64
then jump fill

if x == 56
then jump filled

x += 8
j := 0
jump fill

: filled
i := 0xf00
load vf
i := 0x000
save vf
i := 0xf10
load vf
i := 0x010
save vf
i := 0xf20
load vf
i := 0x020
save vf
i := 0xf30
load v1
i := 0x030
save v1

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
p := 0
:call cas

v1 := delay
v0 := 255
v0 -= v1
i := digits
bcd v0
i := digits
load v2
v3 := 63
v4 := 59
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
p -= 9
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
#vf := 0
if s == 0
then vf := 1
return

: cas
:breakpoint cas
c := 0
m := 1
t := 2
v1 := 0
j := 15

: casl
:call ____cas0
:call ____cas
:call ____cas
:call ____cas
:call ____cas
:call ____cas
:call ____cas
:call ____cas

if c == 0xff
then return

if j == 1 then
return

x -= 56
j -= 1
jump casl

: ____cas
x += 8

: ____cas0
p := x
p <<= p
c <<= c
if vf != 0
then jump ____scas

s := 0
i := bottles
i += p

define(`X',`dnl
load v0
: ____lcas`'$1
i += m
if v0 == 0
then jump ____bcas`'$1

if j == `'$1
then jump ____ecas

p += 1
')dnl

X(0)
X(1)
X(2)
X(3)
X(4)
X(5)
X(6)
X(7)
X(8)
X(9)
X(10)
X(11)
X(12)
X(13)
X(14)

undefine(`X')dnl

: ____ecas
vf := 1
if s == 0 then
: ____scas
c |= vf
return







define(`X',`dnl
: ____bfcas`'$1
m := 1
p += 1
jump ____lcas`'incr($1)
')dnl

X(0)
X(1)
X(2)
X(3)
X(4)
X(5)
X(6)
X(7)
X(8)
X(9)
X(10)
X(11)
X(12)
X(13)

undefine(`X')dnl
: ____bfcas14
m := 1
jump ____ecas

define(`X',`dnl
: ____bcas`'$1
load v0
m &= v0
if m == 0
then jump ____bfcas`'$1

i := _spr
i += v0
vf := `'eval(4*$1)
sprite x vf 7
s += vf
i := bottles
i += p
save v1

if j == `'incr($1) then
#:breakpoint exit
jump ____ecas

i += t
p += 1
')dnl

X(0)
X(1)
X(2)
X(3)
X(4)
X(5)
X(6)
X(7)
X(8)
X(9)
X(10)
X(11)
X(12)
X(13)
X(14)

undefine(`X')dnl

return

:monitor bottles 256

: digits
0 0 0

define(`P', `56')dnl
define(`Y', `124')dnl 0111.1100
define(`R', `108')dnl 0110.1100
define(`B',  `68')dnl 0100.0100
define(`A', `$1 $2 $1 0 $3 $4 $3 0')dnl

: _spr
0
A(P, Y, P, Y)     # 00 Y Y
A(P, R, P, R)     # 08 R R
A(P, B, P, B)     # 10 B B

: p2s
255 76 15

:org 0xf00
: digit0
0xE0 0xA0 0xA0 0xA0 0xE0
: digit1
0x20 0x20 0x20 0x20 0x20
: digit2
0xE0 0x20 0xE0 0x80 0xE0
: digit3
0xE0 0x20 0xE0 0x20 0xE0
: digit4
0xA0 0xA0 0xE0 0x20 0x20
: digit5
0xE0 0x80 0xE0 0x20 0xE0
: digit6
0xE0 0x80 0xE0 0xA0 0xE0
: digit7
0xE0 0x20 0x20 0x20 0x20
: digit8
0xE0 0xA0 0xE0 0xA0 0xE0
: digit9
0xE0 0xA0 0xE0 0x20 0xE0
