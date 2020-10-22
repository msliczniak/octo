# draw.m4

: draw

M0 &= GHOST
_BP(`draw')
if M0 == 0
then jump _draw1

i := spritebu:0
sprite X0 Y0 15

: _draw1
M1 &= GHOST
if M1 == 0
then jump _draw2

i := spritebu:1
sprite X1 Y1 15

: _draw2
M2 &= GHOST
if M2 == 0
then jump _draw3

i := spritebu:2
sprite X2 Y2 15

: _draw3
M3 &= GHOST
if M3 == 0
then return

i := spritebu:3
sprite X3 Y3 15
return
