# tetrisconcept.net/threads/dr-mario-virus-placement.2037/page-2#post-63038

# SC version

:alias s v9
:alias x vA
:alias y vB
:alias m vC
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

if v0 == 0xff
then jump fill_a

i := py
i += v0
sprite x y 3

: fill_a

pos += 1
y -= 4
if y != 253
then jump fill

if x == 56
then jump filled

x += 8
pos += 2
y := 61
jump fill

: filled

i := py
ve := 64
vf := 1
sprite ve vf 3

#:breakpoint bar

: collapse

pos := 0
y := 57

x := 0

s := 0

: collapse_a

i := abottle1
i += pos
load v1

if v0 != 0xff
then jump collapse_e

if v1 == 0xff
then jump collapse_e

s := 1
v0 := v1
v1 := 0xff
save v1

i := py
i += v0
sprite x y 7

: collapse_e

if y == 1
then jump collapse_b

y -= 4
pos += 1

jump collapse_a

: collapse_b

if x == 64
then jump collapse_c

#:breakpoint foo

x += 8
y := 57
pos += 4

i := py
ve := 64
vf := 1
sprite ve vf 7

jump collapse_a

: collapse_c

if s != 0
then jump collapse

# collapsed

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

: abottle
0x00

: abottle0
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
 0x00 0x00

: abottle1
0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x20 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x10  0xff 0x00

: abottle2
0xff 0xff 0xff 0xff 0xff 0xff 0x10 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00 0xff
 0xff 0x00

: abottle3
0xff 0xff 0xff 0xff 0xff 0x00 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x20 0xff 0xff
 0xff 0x00

: abottle4
0xff 0xff 0xff 0xff 0x20 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x10 0xff 0xff 0xff
 0xff 0x00

: abottle5
0xff 0xff 0xff 0x10 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00 0xff 0xff 0xff 0xff
 0xff 0x00

: abottle6
0xff 0xff 0x00 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x20 0xff 0xff 0xff 0xff 0xff
 0xff 0x00

: abottle7
0xff 0x20 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x10 0xff 0xff 0xff 0xff 0xff 0xff
 0xff 0x00

: abottle8
0x10 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0x00 0xff 0xff 0xff 0xff 0xff 0xff 0xff
 0xff 0x00

: abottle9
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
 0x00

: dots
0x80 0x00 0x00 0x00 0x80 0x00 0x00 0x00 0x80 0x00 0x00 0x00 0x80

:monitor abottle 180

: py
0x38 0x7C 0x38 0x00 0x38 0x7C 0x38
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00

: pr
0x38 0x6C 0x38 0x00 0x38 0x6C 0x38
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00

: pb
0x38 0x44 0x38 0x00 0x38 0x44 0x38
0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
