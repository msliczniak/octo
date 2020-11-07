# defines.m4

changequote(<!,!>)dnl
<!:stringmode safe " !\"#$%&'()*+,-./0123456789:;<=>?" { :byte { CHAR } }!> #
<!:stringmode safe "@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_" { :byte { CHAR } }!> #
<!:stringmode safe "`abcdefghijklmnopqrstuvwxyz{|}~"   { :byte { CHAR } }!> #
changequote`'dnl

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
jump _handheld

:byte 0
safe "@(#)onetenth "
changequote(<!,!>)dnl
safe "syscmd(<!/bin/date -ju '+%Y-%m-%d %H:%M:%S-%Z"'!>)
changequote`'dnl
:byte 0

: _handheld
# patch around chip-8x code
v1 := 0xee  # return from subroutine
i := _bb1
save v1
i := _bb0
load v1
i := __bb0
save v1
i := _bb2
load v1
i := __bb2
save v1

:call reset

vd := 0
ve := 255
 i := draw,z,a,p
 load vb
:call draw
 i := draw,z,b,p
 load vb
:call draw

i := ff11
vd := 32
vc := 32
vb := 43
va := 54

: invert_loop
sprite vd vc 11
sprite vd vb 11
sprite vd va 10
if vd == 56
then jump inverted
vd += 8
jump invert_loop

: inverted
i := isym0
vc += 1 # gives a nice box effect
sprite vd vc 7

jump root

:assert "handheld entry polint too large" { HERE <= 0x300 }

:org 0x300  # CHIP-8X
0x02 0xa0   # black on black
vf := 0
buzzer := vf

# colormap at 0xc00 on 1862/1864
# use these registers on ETI-660 https://chip-8.github.io/extensions/#chip-8x

vd := 7     # white
ve := 0x34  # h: start at region 4 and color 3 + 1 regions
vf := 0x70  # v: start at region 0 and color 7 + 1 regions
0xbe 0xd0

vd := 0     # black
ve := 0x30  # h: start at region 0 and color 3 + 1 regions
vf := 0x70  # v: start at region 0 and color 7 + 1 regions
0xbe 0xd0

i := _pt0
load v1
i := _skip0_prevboard
save v1

i := _pt1
load v1
i := _skip1_prevboard
save v1

i := _pt2
load v1
i := _skip2_prevboard
save v1

:call reset

#0x02 0xa0   # black on green
#0x02 0xa0   # black on red
#0x02 0xa0   # black on blue

vd := 1     # red
ve := 0x30  # h: start at region 0 and color 3 + 1 regions
vf := 0x70  # v: start at region 0 and color 7 + 1 regions
0xbe 0xd0

jump root

: _pt0
jump skip0_prevboard

: _pt1
jump skip1_prevboard

: _pt2
jump skip2_prevboard

:assert "chip-8x entry polint too large" { HERE <= 0x600 }

dnl need extra headroom for testing
#jump _entry_point
#
#:org 0x600  # ETI660
#v0 := 0
#buzzer := v0

: _entry_point
