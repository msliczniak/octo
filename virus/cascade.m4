# tetrisconcept.net/threads/dr-mario-virus-placement.2037/page-2#post-63038

# SC version

:alias s v9
:alias x vA
:alias y vB
#:alias m vC
:alias pos vD

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

pos := 0
x := 0
y := 61

: fill

i := abottle1
i += pos
load v0

if v0 == 0xf0
then jump fill_a

i := array
i += v0
sprite x y 7

: fill_a

pos += 1
y -= 8
if y != 249
then jump fill

if x == 56
then jump filled

x += 8
pos += 1
y := 61
jump fill

: filled

i := py
ve := 64
vf := 1
sprite ve vf 3

:breakpoint bar

#m := 1
v0 := 255
delay := v0

dnl CASCADE(PASS, RA, RB, RC, RD)
dnl
define(`CASCADE', `dnl
: `cascade':`$1':`$2':`$3':a
if `$2' == 0xff
then jump `cascade':`$1':`$2':`$3':b

y -= 4
jump `cascade':`$1':`$3':`$4':a

: `cascade':`$1':`$2':`$3':b
if `$3' != 0xff
then jump `cascade':`$1':`$2':`$3':c

y -= 4
jump `cascade':`$1':`$3':`$4':b

: `cascade':`$1':`$2':`$3':c
vF := 0xc0
vF &= `$3'
if vF == 0
then jump `cascade':`$1':`$2':`$3':d

y -= 8
jump `cascade':`$1':`$4':`$5':a

: `cascade':`$1':`$2':`$3':d
s := 1
`$2' := `$3'
`$3' := 0xff

i := py
i += `$2'
sprite x y 7

y -= 4
')dnl

: cascade:a
pos := 0
y := 57
x := 0
s := 0

: cascade:b
i := abottle1
i += pos
load v8

CASCADE(`0', `v0', `v1', `v2', `v3')
CASCADE(`0', `v1', `v2', `v3', `v4')
CASCADE(`0', `v2', `v3', `v4', `v5')
CASCADE(`0', `v3', `v4', `v5', `v6')
CASCADE(`0', `v4', `v5', `v6', `v7')
CASCADE(`0', `v5', `v6', `v7', `v8')
CASCADE(`0', `v6', `v7', `v', `v')
CASCADE(`0', `v7', `v8', `v', `v')

: cascade:0:v7:v:a
: cascade:0:v7:v:b
: cascade:0:v8:v:a
: cascade:0:v8:v:b
: cascade:0:v:v:a
i := abottle1
i += pos
save v8
pos += 8
i := abottle1
i += pos
load v7

CASCADE(`1', `v0', `v1', `v2', `v3')
CASCADE(`1', `v1', `v2', `v3', `v4')
CASCADE(`1', `v2', `v3', `v4', `v5')
CASCADE(`1', `v3', `v4', `v5', `v6')
CASCADE(`1', `v4', `v5', `v6', `v7')
CASCADE(`1', `v5', `v6', `v7', `v8')
CASCADE(`1', `v6', `v7', `v', `v')
CASCADE(`1', `v7', `v8', `v', `v')

: cascade:1:v7:v:a
: cascade:1:v7:v:b
: cascade:1:v8:v:a
: cascade:1:v8:v:b
: cascade:1:v:v:a
i := abottle1
i += pos
save v7
pos += 10

# indicate one col done
i := py
ve := 64
vf := 1
sprite ve vf 7

if x == 56
then jump cascade:c

x += 8
y := 57

jump cascade:b

: cascade:c

if s != 0
then jump cascade:a

# cascaded

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
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 

: abottle1
0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xc0
: abottle2
0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xc0
: abottle3
0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xc0
: abottle4
0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xc0
: abottle5
0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xc0
: abottle6
0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xc0
: abottle7
0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xc0
: abottle8
0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xc0

0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 

: bbottle1
0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xc0
: bbottle2
0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xc0
: bbottle3
0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xc0
: bbottle4
0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xc0
: bbottle5
0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xc0
: bbottle6
0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xc0
: bbottle7
0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xc0
: bbottle8
0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xf0 0xc0

0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 

: dots
0x80 0x00 0x00 0x00 0x80 0x00 0x00 0x00 0x80 0x00 0x00 0x00 0x80

:monitor bottles 180

: py
0x38 0x7C 0x38 0x00 0x38 0x7C 0x38
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00

: pr
0x38 0x6C 0x38 0x00 0x38 0x6C 0x38
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00

: pb
0x38 0x44 0x38 0x00 0x38 0x44 0x38
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00

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
