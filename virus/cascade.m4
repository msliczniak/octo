# tetrisconcept.net/threads/dr-mario-virus-placement.2037/page-2#post-63038

# SC version

:alias lfsr0		vD
:alias lfsr1		vE
:alias c0				v3
:alias c1				v4
:alias s0				v5
:alias s1				v6
:alias s2				v7
:alias x				v8
:alias y				v9
:alias viruses	vA
:alias level		vB

:alias pos lfsr0
:alias type lfsr1
:alias surrounding c0

: main
hires

#:breakpoint main

: gen

i := iv
v0 := 0
v1 := 16
v2 := 32
v3 := 48
v4 := 64
v5 := 80
v6 := 96
v7 := 112

sprite v4 v0 0
sprite v4 v1 0
sprite v4 v2 0
sprite v4 v3 0

sprite v5 v0 0
sprite v5 v1 0
sprite v5 v2 0
sprite v5 v3 0

sprite v6 v0 0
sprite v6 v1 0
sprite v6 v2 0
sprite v6 v3 0

sprite v7 v0 0
sprite v7 v1 0
sprite v7 v2 0
sprite v7 v3 0

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

s0 := 0

: collapse_a

i := abottle1
i += pos
load v1

if v0 != 0xff
then jump collapse_e

if v1 == 0xff
then jump collapse_e

s0 := 1
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

if s0 == 0
then jump collapsed

jump collapse

: collapsed

# pause

s0 := 15
buzzer := s0
s0 := key
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

: iv
0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff
0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff

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
