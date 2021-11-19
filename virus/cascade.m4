# tetrisconcept.net/threads/dr-mario-virus-placement.2037/page-2#post-63038

# SC version

:alias m v8
:alias s v9
:alias x vA
:alias y vB
:alias pos vC

: main
hires

#:breakpoint main

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

: fill

i := bottle0a
i += pos
load v0

if v0 == 0xf0
then jump fill_a

i := array
i += v0
sprite x y 7

: fill_a

pos += 1
y += 8
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

#:breakpoint bar

v0 := 255
delay := v0

x := 0
y := 49
pos := 1
m := 0xff
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

m <<= m
if vF == 0
then jump cascade_skip`'$1

i := bottle0a
i += pos
load v`'$1

:call cascade`'$1
if s != 1
then jump cascade_skip`'$1

m |= s
i := bottle0a
i += pos
save v`'$1

: cascade_skip`'$1
s := 56
s &= x
if s == 56
then jump cascade_done`'$1

pos += 9
x += 8
#y += 56
y := 49
jump cascade_loop`'$1

: cascade_done`'$1')dnl

: cascade
CASCADE(7)
x -= 56
#y += 56
#pos -= 62
y := 49
pos := 2

CASCADE(6)
x -= 56
#y += 48
#pos -= 61
y := 49
pos := 3

CASCADE(5)
x -= 56
#y += 40
#pos -= 60
y := 49
pos := 4

CASCADE(4)
x -= 56
#y += 32
#pos -= 59
y := 49
pos := 5

CASCADE(3)
x -= 56
#y += 24
#pos -= 58
y := 49
pos := 6

CASCADE(2)
x -= 56
#y += 16
#pos -= 57
y := 49
pos := 7

CASCADE(1)
x -= 56
#y += 8
#pos -= 56
y := 49
pos := 8

CASCADE(0)
return

undefine(`CASCADE')dnl
define(`CASCADE',`dnl
: cascade`'$1
if v`'$1 == 0xf0
then jump cascade_twoblank`'$1

y -= 8
jump cascade`'decr($1)

: cascade_twoblank`'$1
if v`'decr($1) != 0xf0
then jump cascade_checktwodrop`'$1

y -= 8
jump cascade_twoblank`'decr($1)

: cascade_checktwodrop`'$1
vF := 0xf
vF &= v`'decr($1)
if vF == 0
then jump cascade_twodrop`'$1

vF := 3
vF &= v`'decr($1)
if vF != 0
then jump cascade_onedrop`'$1

y -= 8
jump cascade`'decr($1)

: cascade_twodrop`'$1
i := array
i += v`'decr($1)
sprite x y 15

s := 1
v`'$1 := v`'decr($1)
v`'decr($1) := 0xf0
y -= 8
jump cascade_dropped`'$1

: cascade_onedrop`'$1
i := array
i += v`'decr($1)
sprite x y 15

s := 1
v`'$1 := v`'decr($1)
v`'decr($1) := 0xf0
y -= 8
jump cascade_dropped`'$1

: cascade_dropped`'$1
')dnl

CASCADE(7)
CASCADE(6)
CASCADE(5)
CASCADE(4)
CASCADE(3)
CASCADE(2)
CASCADE(1)
: cascade0
: cascade_twoblank0
return

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
0xfc 0x00 0x80 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0
     : bottle1a
0xfc 0x10 0x90 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0
     : bottle2a
0xfc 0x20 0xa0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0
     : bottle3a
0xfc 0x30 0xb0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0
     : bottle4a
0xfc 0x40 0xc0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0
     : bottle5a
0xfc 0x50 0xd0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0
     : bottle6a
0xfc 0x60 0xe0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0
     : bottle7a
0xfc 0x70 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0

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

:monitor bottles 180

: digits
0 0 0

define(`P', `56')dnl
define(`Y', `124')dnl
define(`R', `108')dnl
define(`B', `68')dnl
define(`A', `$1 $2 $1 0 $3 $4 $3 0 $1 $2 $1 0 $3 $4 $3 0')dnl
define(`C', `$1 $2 $1 0 eval($1 ^ $3) eval($2 ^ $4) eval($1 ^ $3) 0 $3 $4 $3 0 0 0 0 0')dnl

: array
A(P, Y, P, Y)
A(P, Y, P, R)
A(P, Y, P, B)
A(P, Y, 0, 0)

A(P, R, P, Y)
A(P, R, P, R)
A(P, R, P, B)
A(P, R, 0, 0)

A(P, B, P, Y)
A(P, B, P, R)
A(P, B, P, B)
A(P, B, 0, 0)

A(0, 0, P, Y)
A(0, 0, P, R)
A(0, 0, P, B)


C(P, Y, P, Y)
C(P, Y, P, R)
C(P, Y, P, B)
C(P, Y, 0, 0)

C(P, R, P, Y)
C(P, R, P, R)
C(P, R, P, B)
C(P, R, 0, 0)

C(P, B, P, Y)
C(P, B, P, R)
C(P, B, P, B)
C(P, B, 0, 0)

C(0, 0, P, Y)
C(0, 0, P, R)
C(0, 0, P, B)
