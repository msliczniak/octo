# spboard.m4

dnl v5 := 0 or 8    # board sym
dnl v6 := 0 or 56   # board sprite
: spb,z
v7 := 8
v8 := 14
COLOR := GHOST

: _spbl
COLOR <<= COLOR
if vf == 0
then jump _spbn

# sym
i := board
i += v5
load v0

# sprite
i := isym0
i += v0
load B4

# board
i := sprite:0:1
i += v6
save B4

: _spbn
if COLOR == 0
then return

v5 += 1
v6 += v7
v7 ^= v8
jump _spbl
