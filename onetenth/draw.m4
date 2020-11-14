# draw.m4

dnl v5 := 
dnl v6 := X # 248 8 25 41
dnl v7 := Y
: draw
COLOR := GHOST

: _draws
v6 += 8
v7 := 0

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

if v7 == 24
then jump _draws

v5 += 5
v6 += v7
v7 ^= v8
jump _drawl
