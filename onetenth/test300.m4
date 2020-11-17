define(`return', `:byte 0 240')dnl

:org 0x300
: main
:byte 0x02 0xf0   # black on black

v0 := 0xec  # SEC, 2 cycles

# have sprite just copy instead of xor
i := 0xbf
# save v0
i := 0xcf
# save v0

# don't wait for VBLANK, replace IDLE with next instruction
i := 0xac
save v0

v0 := eval(8 * 0)
v1 := eval(8 * 1)
v2 := eval(8 * 2)
v3 := eval(8 * 3)
v4 := eval(8 * 4)
v5 := eval(8 * 5)
v6 := eval(8 * 6)
v7 := eval(8 * 7)
i := sp

vd := 0     # black
ve := eval(8 * 0)
vf := 16
0xbe 0xdf
ve := eval(8 * 1)
0xbe 0xdf
ve := eval(8 * 2)
0xbe 0xdf
ve := eval(8 * 3)
0xbe 0xdf
ve := eval(8 * 4)
0xbe 0xdf
ve := eval(8 * 5)
0xbe 0xdf
ve := eval(8 * 6)
0xbe 0xdf
ve := eval(8 * 7)
0xbe 0xdf

: _mainl
ve := eval(8 * 0)
vf := 0
0xbe 0xdf
ve := eval(8 * 1)
0xbe 0xdf
ve := eval(8 * 2)
0xbe 0xdf
ve := eval(8 * 3)
0xbe 0xdf
ve := eval(8 * 4)
0xbe 0xdf
ve := eval(8 * 5)
0xbe 0xdf
ve := eval(8 * 6)
0xbe 0xdf
ve := eval(8 * 7)
0xbe 0xdf

ve := eval(8 * 4)
vf := 16
0xbe 0xdf
ve := eval(8 * 5)
0xbe 0xdf
ve := eval(8 * 6)
0xbe 0xdf
ve := eval(8 * 7)
0xbe 0xdf

sprite v0 v0 15
sprite v1 v0 15
sprite v2 v0 15
sprite v3 v0 15
sprite v4 v0 15
sprite v5 v0 15
sprite v6 v0 15
sprite v7 v0 15
sprite v0 v2 15
sprite v1 v2 15
sprite v2 v2 15
sprite v3 v2 15
sprite v4 v2 15
sprite v5 v2 15
sprite v6 v2 15
sprite v7 v2 15
sprite v0 v4 15
sprite v1 v4 15
sprite v2 v4 15
sprite v3 v4 15
sprite v4 v4 15
sprite v5 v4 15
sprite v6 v4 15
sprite v7 v4 15
sprite v0 v6 15
sprite v1 v6 15
sprite v2 v6 15
sprite v3 v6 15
sprite v4 v6 15
sprite v5 v6 15
sprite v6 v6 15
sprite v7 v6 15

vd := 7     # white
ve := eval(8 * 0)
vf := 0
0xbe 0xdf
ve := eval(8 * 1)
0xbe 0xdf
ve := eval(8 * 2)
0xbe 0xdf
ve := eval(8 * 3)
0xbe 0xdf
ve := eval(8 * 4)
0xbe 0xdf
ve := eval(8 * 5)
0xbe 0xdf
ve := eval(8 * 6)
0xbe 0xdf
ve := eval(8 * 7)
0xbe 0xdf

vd := 2     # blue
ve := eval(8 * 4)
vf := 16
0xbe 0xdf
ve := eval(8 * 5)
0xbe 0xdf
ve := eval(8 * 6)
0xbe 0xdf
ve := eval(8 * 7)
0xbe 0xdf

vd := key
vd := 0     # black
jump _mainl

: sp
254 254 254 254 254 254 254 0
254 254 254 254 254 254 254
