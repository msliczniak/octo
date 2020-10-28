# defines.m4

dnl concat
define(`_CC', `$1$2$3$4$5$6$7$8$9')dnl
dnl
dnl breakpoint
define(`_BP', `ifdef(`_DEBUG', `:breakpoint _$*')')dnl

include(`chip8.m')

define(`BL',`0')

: main
v0 := 0
_BP(`main')
buzzer := v0
jump _entry_point
0x40 0x28 0x23 0x29 0x6f 0x6e 0x65 0x74 0x65 0x6e 0x74 0x68 0 dnl @(#)onetenth.

:org 0x300  # CHIP-8X
v0 := 0
buzzer := v0

# colormap at 0xc00 on 1862/1864
# NB: must use these registers! https://chip-8.github.io/extensions/#chip-8x

v1 := 0x40  # x: start at region 0 and color 4 + 1 regions
v2 := 0x10  # y: start at region 0 and color 1 + 1 regions
vc := 3     # violet
0xb1 0xc0

v2 := 0x12  # y: start at region 2 and color 1 + 1 regions
vc := 4     # green
0xb1 0xc0

v2 := 0x14  # y: start at region 4 and color 1 + 1 regions
vc := 5     # yellow
0xb1 0xc0

v2 := 0x16  # y: start at region 6 and color 1 + 1 regions
vc := 6     # aqua
0xb1 0xc0

v1 := 0x25  # x: start at region 5 and color 2 + 1 regions
v2 := 0x70  # y: start at region 0 and color 7 + 1 regions
vc := 7     # white
0xb1 0xc0

jump _entry_point

:org 0x600  # ETI660
v0 := 0
buzzer := v0

# FALLTHRU
: _entry_point
