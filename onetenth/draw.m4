# draw.m4

dnl v5 := 
dnl v6 := X # 0 or 33
dnl v7 := Y # 0 or 1
: draw
COLOR := GHOST

: _drawl
COLOR <<= COLOR
if vf == 0
then jump _drawn

i := sprite:0:1
i += v5
sprite v6 v7 5

: _drawn
if COLOR == 0
then return

v8 := 24


v5 += 5
v6 += v7
v7 ^= v8
jump _drawl
