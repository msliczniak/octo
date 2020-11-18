define(`return', `:byte 0 240')dnl

:org 0x300
: main
:byte 0x02 0xf0   # black on black

v0 := 0xec  # SEC, 2 cycles

# have sprite just copy instead of xor
i := 0xbf
save v0

dnl this second location is not needed plus it causes flicker
dnl and a bug in the lower page display
dnl i := 0xcf
dnl save v0

# don't wait for VBLANK, replace IDLE with next instruction
i := 0xac
save v0

# don't wait for VBLANK in BXYN, replace IDLE with nop
# this causes a slight visual disturbance as columns are momentarily
# shifted up slightly
v0 := 0xc4  # CONT, 3 cycles
i := 0x25a
save v0

vd :=  7    # white
vf := 48
ve := eval(8 * 4)
0xbe 0xdf
ve := eval(8 * 5)
0xbe 0xdf
ve := eval(8 * 6)
0xbe 0xdf
ve := eval(8 * 7)
0xbe 0xdf
vf := 32
ve := eval(8 * 4)
0xbe 0xdf
ve := eval(8 * 5)
0xbe 0xdf
ve := eval(8 * 6)
0xbe 0xdf
ve := eval(8 * 7)
0xbe 0xdf

v0 := eval(8 * 0)
v1 := eval(8 * 1)
v2 := eval(8 * 2)
v3 := eval(8 * 3)
v4 := eval(8 * 4)
v5 := eval(8 * 5)
v6 := eval(8 * 6)
v7 := eval(8 * 7)
i := sp
va := 0

: _mainl
v8 := 255
delay := v8

: _timel
v8 := delay
if v8 == 253
then jump _timel

vd :=  0    # black
vf := 16
ve := eval(8 * 0)
0xbe 0xdf
ve := eval(8 * 1)
0xbe 0xdf
ve := eval(8 * 2)
0xbe 0xdf
ve := eval(8 * 3)
0xbe 0xdf
vf := 0
ve := eval(8 * 0)
0xbe 0xdf
ve := eval(8 * 1)
0xbe 0xdf
ve := eval(8 * 2)
0xbe 0xdf
ve := eval(8 * 3)
0xbe 0xdf

sprite v0 v0 7
sprite v1 v0 7
sprite v2 v0 7
sprite v3 v0 7
sprite v0 v1 7
sprite v1 v1 7
sprite v2 v1 7
sprite v3 v1 7
sprite v0 v2 7
sprite v1 v2 7
sprite v2 v2 7
sprite v3 v2 7
sprite v0 v3 7
sprite v1 v3 7
sprite v2 v3 7
sprite v3 v3 7

sprite v4 v0 7
sprite v5 v0 7
sprite v6 v0 7
sprite v7 v0 7
sprite v4 v1 7
sprite v5 v1 7
sprite v6 v1 7
sprite v7 v1 7
sprite v4 v2 7
sprite v5 v2 7
sprite v6 v2 7
sprite v7 v2 7
sprite v4 v3 7
sprite v5 v3 7
sprite v6 v3 7
sprite v7 v3 7

#sprite v4 v4 7
#sprite v5 v4 7
#sprite v6 v4 7
#sprite v7 v4 7
#sprite v4 v5 7
#sprite v5 v5 7
#sprite v6 v5 7
#sprite v7 v5 7
#sprite v4 v6 7
#sprite v5 v6 7
#sprite v6 v6 7
#sprite v7 v6 7
#sprite v4 v7 7
sprite v5 v7 7
sprite v6 v7 7
sprite v7 v7 7

vd := 2     # blue
vf := 48
ve := eval(8 * 0)
0xbe 0xdf
ve := eval(8 * 1)
0xbe 0xdf
ve := eval(8 * 2)
0xbe 0xdf
ve := eval(8 * 3)
0xbe 0xdf
vf := 32
ve := eval(8 * 0)
0xbe 0xdf
ve := eval(8 * 1)
0xbe 0xdf
ve := eval(8 * 2)
0xbe 0xdf
ve := eval(8 * 3)
0xbe 0xdf

v8 := delay
vf := 253
v8 =- vf
v9 := v8

i := hex v8
sprite v1 v7 5
v8 >>= v8
v8 >>= v8
v8 >>= v8
v8 >>= v8
i := hex v8
sprite v0 v7 5

vd := key

i := hex v9
sprite v1 v7 5
v9 >>= v9
v9 >>= v9
v9 >>= v9
v9 >>= v9
i := hex v9
sprite v0 v7 5

i := sp
vf := 7
va ^= vf
i += va
jump _mainl

: sp
 92 170  92 170  92 170  92
170  92 170  92 170  92 170
