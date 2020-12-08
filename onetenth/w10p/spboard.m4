# spboard.m4

dnl v5 := 0 or 8    # board sym
: spb
if MEM0 == 0
then return

COLOR := MEM0

: _spbl
COLOR <<= COLOR
if vf == 0
then jump _spbn

i := board
i += v5
load v0

dnl i := isym0 or sym0
:byte 0xac
: _spbt
:byte 0xa7

i += v0
sprite v1 v2 5

: _spbn
if COLOR == 0
then return

v5 += 1
if v2 == v4
then jump _spbs

#v2 += v6
v2 += 8
jump _spbl

: _spbs
v1 += 8
v2 -= 24
jump _spbl
