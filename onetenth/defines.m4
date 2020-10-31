# defines.m4

changequote(<!,!>)dnl
:stringmode safe <!" !\"#$%&'()*+,-./0123456789:;<=>?"!> { :byte { CHAR } } #
:stringmode safe <!"@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_"!> { :byte { CHAR } } #
:stringmode safe <!"`abcdefghijklmnopqrstuvwxyz{|}~"!>   { :byte { CHAR } } #
changequote`'dnl

dnl concat
define(`_CC', `$1$2$3$4$5$6$7$8$9')dnl
dnl
dnl breakpoint
define(`_BP', `ifdef(`_DEBUG', `:breakpoint _$*')')dnl

include(`chip8.m')

define(`BL',`0')

: main
vf := 0
_BP(`main')
buzzer := vf
jump _handheld

:byte 0
safe "@(#)onetenth "
changequote(<!,!>)dnl
safe "syscmd(<!/bin/date -ju '+%Y-%m-%d %H:%M:%S-%Z"'!>)
changequote`'dnl
:byte 0

: _handheld
:call reset
jump _entry_point

:assert "handheld entry polint too large" { HERE <= 0x300 }

:org 0x300  # CHIP-8X
v0 := 0
buzzer := v0

# colormap at 0xc00 on 1862/1864
# NB: must use these registers! https://chip-8.github.io/extensions/#chip-8x

v1 := 0x70  # x: start at region 0 and color 7 + 1 regions
v2 := 0x70  # y: start at region 0 and color 7 + 1 regions
vc := 7     # white
0xb1 0xc0

i := _pt0
load v1
i := _skip0_prevboard
save v1

jump root

: _pt0
jump skip0_prevboard

:assert "chip-8x entry polint too large" { HERE <= 0x600 }

dnl need extra headroom for testing
#jump _entry_point
#
#:org 0x600  # ETI660
#v0 := 0
#buzzer := v0

: _entry_point
