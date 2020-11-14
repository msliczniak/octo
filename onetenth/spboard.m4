# spboard.m4

dnl v5 := 0 or 8    # board sym
dnl v6 := 0 or 90   # board sprite
dnl v7 := X         # 248 8 25 41
dnl v8 := Y
: spb
COLOR := GHOST

: _spbs
v7 += 8
v8 := 0

: _spbl
COLOR <<= COLOR
if vf == 0
then jump _spbn

i := board
i += v5
load v0

i := isym0
i += v6
i += v0

sprite v7 v8 5

: _spbn
if COLOR == 0
then return

if v8 == 24
then jump _spbs

v5 += 1
v8 += 8
jump _spbl
