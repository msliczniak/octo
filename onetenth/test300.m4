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
v0 := 0xc4  # CONT, 3 cycles
i := 0x25a
save v0

dnl Y in lower page forces lores color
dnl refer to bxyn.asm
i := 0x282
v0 := 0xc3
save v0
i := 0x288
v0 := 32
save v0

v0 := 0xf0
v1 := 0xf1
v2 := 0xf2
v3 := 0xf3
v4 := 0xf4
v5 := 0xf5
v6 := 0xf6
v7 := 0xf7
v8 := 0xf8
v9 := 0xf9
va := 0xfa
vb := 0xfb
vc := 0xfc
vd := 0xfd
ve := 0xfe
vf := 0xff
i := 0x400
save vf
v0 := 0x0
v1 := 0x1
v2 := 0x2
v3 := 0x3
v4 := 0x4
v5 := 0x5
v6 := 0x6
v7 := 0x7
v8 := 0x8
v9 := 0x9
va := 0xa
vb := 0xb
vc := 0xc
vd := 0xd
ve := 0xe
vf := 0xf
save vf

i := 0x16b # change load to:
v0 := 0x4a # load advance
save v0

i := 0x400
load vf

: forever jump forever

vd :=  7    # white
vf := 32
ve := eval(8 * 4)
0xbe 0xd8
ve := eval(8 * 5)
0xbe 0xd8
ve := eval(8 * 6)
0xbe 0xd8
ve := eval(8 * 7)
0xbe 0xd8

v0 := eval(8 * 0)
v1 := eval(8 * 1)
v2 := eval(8 * 2)
v3 := eval(8 * 3)
v4 := eval(8 * 4)
v5 := eval(8 * 5)
v6 := eval(8 * 6)
v7 := eval(8 * 7)

i := ff15
sprite v0 v0 15
sprite v1 v0 15
sprite v2 v0 15
sprite v3 v0 15
sprite v0 v2 15
sprite v1 v2 15
sprite v2 v2 15
sprite v3 v2 15

# checker
sprite v4 v0 15
sprite v6 v0 15
sprite v5 v2 15
sprite v7 v2 15
sprite v4 v4 15
sprite v6 v4 15
sprite v5 v6 15
sprite v7 v6 15

#v0 += 1
#v1 += 1
#v2 += 1
#v3 += 1
#v4 -= 1
#v5 -= 1
#v6 -= 1
#v7 -= 1
v4 += 1
v5 += 1
v6 += 1
v7 += 1
v4 += 1
v5 += 1
v6 += 1
v7 += 1
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
ve := eval(8 * 0)
vf := 32
0xbe 0xd2
vf := 40
0xbe 0xd2
vf := 48
0xbe 0xd2
vf := 56
0xbe 0xd2
ve := eval(8 * 1)
vf := 32
0xbe 0xd2
vf := 40
0xbe 0xd2
vf := 48
0xbe 0xd2
vf := 56
0xbe 0xd2
ve := eval(8 * 2)
vf := 32
0xbe 0xd2
vf := 40
0xbe 0xd2
vf := 48
0xbe 0xd2
vf := 56
0xbe 0xd2
ve := eval(8 * 3)
vf := 32
0xbe 0xd2
vf := 40
0xbe 0xd2
vf := 48
0xbe 0xd2
vf := 56
0xbe 0xd2

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

sprite v4 v4 7
sprite v5 v4 7
sprite v6 v4 7
sprite v7 v4 7
sprite v4 v5 7
sprite v5 v5 7
sprite v6 v5 7
sprite v7 v5 7
sprite v4 v6 7
sprite v5 v6 7
sprite v6 v6 7
sprite v7 v6 7
sprite v4 v7 7
sprite v5 v7 7
sprite v6 v7 7
sprite v7 v7 7

sprite v5 v1 7
sprite v6 v1 7
sprite v7 v1 7

vd := 2     # blue
ve := eval(8 * 0)
vf := 32
0xbe 0xd2
vf := 40
0xbe 0xd2
vf := 48
0xbe 0xd2
vf := 56
0xbe 0xd2
ve := eval(8 * 1)
vf := 32
0xbe 0xd2
vf := 40
0xbe 0xd2
vf := 48
0xbe 0xd2
vf := 56
0xbe 0xd2
ve := eval(8 * 2)
vf := 32
0xbe 0xd2
vf := 40
0xbe 0xd2
vf := 48
0xbe 0xd2
vf := 56
0xbe 0xd2
ve := eval(8 * 3)
vf := 32
0xbe 0xd2
vf := 40
0xbe 0xd2
vf := 48
0xbe 0xd2
vf := 56
0xbe 0xd2

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

: ff15
255 255 255 255 255 255 255 255 255 255 255 255 255 255 255
