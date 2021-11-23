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

dnl define(`CASCADE',`dnl
dnl : cascade_loop`'$1
dnl # indicate one col done
dnl i := array
dnl ve := 64
dnl vf := 1
dnl sprite ve vf 7
dnl 
dnl m <<= m
dnl if vF == 0
dnl then jump cascade_skip`'$1
dnl 
dnl i := bottle0a
dnl i += pos
dnl load v`'$1
dnl 
dnl :call cascade`'$1
dnl if s != 1
dnl then jump cascade_skip`'$1
dnl 
dnl m |= s
dnl i := bottle0a
dnl i += pos
dnl save v`'$1
dnl 
dnl : cascade_skip`'$1
dnl s := 56
dnl s &= x
dnl if s == 56
dnl then jump cascade_done`'$1
dnl 
dnl pos += 9
dnl x += 8
dnl #y += 56
dnl y := 49
dnl jump cascade_loop`'$1
dnl 
dnl : cascade_done`'$1')dnl

define(`X',`dnl
: cascade`'incr($1)
y -= 4
vE <<= v`'incr($1)
if vF != 0
then jump blchk`'$1

i := array
i += vE
sprite x y 7

v`'decr($1) := v`'$1
')dnl

: cascade
if v8 != 24
then jump blchk7

X(6)
X(5)
X(4)
X(3)
X(2)
X(1)

undefine(`X')dnl

define(`X',`dnl
: blchk`'$1
v`'incr($1) := 24
if v`'$1 != 24
then jump bl`'$1
')dnl

X(7)
X(6)
X(5)
X(4)
X(3)
X(2)
X(1)

undefine(`X')dnl

dnl : cascade
dnl CASCADE(7)
dnl x -= 56
dnl #y += 56
dnl #pos -= 62
dnl y := 49
dnl pos := 2
dnl 
dnl CASCADE(6)
dnl x -= 56
dnl #y += 48
dnl #pos -= 61
dnl y := 49
dnl pos := 3
dnl 
dnl CASCADE(5)
dnl x -= 56
dnl #y += 40
dnl #pos -= 60
dnl y := 49
dnl pos := 4
dnl 
dnl CASCADE(4)
dnl x -= 56
dnl #y += 32
dnl #pos -= 59
dnl y := 49
dnl pos := 5
dnl 
dnl CASCADE(3)
dnl x -= 56
dnl #y += 24
dnl #pos -= 58
dnl y := 49
dnl pos := 6
dnl 
dnl CASCADE(2)
dnl x -= 56
dnl #y += 16
dnl #pos -= 57
dnl y := 49
dnl pos := 7
dnl 
dnl CASCADE(1)
dnl x -= 56
dnl #y += 8
dnl #pos -= 56
dnl y := 49
dnl pos := 8
dnl 
dnl CASCADE(0)
dnl return
dnl 
dnl undefine(`CASCADE')dnl
dnl define(`CASCADE',`dnl
dnl : cascade`'$1
dnl if v`'$1 == 0xf0
dnl then jump cascade_twoblank`'$1
dnl 
dnl y -= 8
dnl jump cascade`'decr($1)
dnl 
dnl : cascade_twoblank`'$1
dnl if v`'decr($1) != 0xf0
dnl then jump cascade_twodrop`'$1
dnl 
dnl y -= 8
dnl jump cascade_twoblank`'decr($1)
dnl 
dnl : cascade_twodrop`'$1
dnl i := array
dnl i += v`'decr($1)
dnl sprite x y 15
dnl 
dnl s := 1
dnl v`'$1 := v`'decr($1)
dnl v`'decr($1) := 0xf0
dnl y -= 8
dnl ')dnl
dnl 
dnl CASCADE(7)
dnl CASCADE(6)
dnl CASCADE(5)
dnl CASCADE(4)
dnl CASCADE(3)
dnl CASCADE(2)
dnl CASCADE(1)
dnl : cascade0
dnl : cascade_twoblank0
dnl return

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
