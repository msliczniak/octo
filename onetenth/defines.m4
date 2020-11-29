# defines.m4

ifdef(`_DEBUG', `', `define(`return', `:byte 0 240')')dnl

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
define(`_BP')dnl

include(`chip8.m')

# 64 bytes free 2b0-2ef
define(`FILLER',`688')dnl
define(`BL',`0')dnl

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
dnl :byte 0 # first byte of return below is 0
: bxyn
#:breakpoint BXYN
v0 += 0
return

: bedf
:call bxyn
return
: _bedf
:call bedf

: b2d7
:call bxyn
return
: _b2d7
:call b2d7

: b707
:call bxyn
return
: _b707
:call b707

: b907
:call bxyn
return
: _b907
:call b907

: bb07
:call bxyn
return
: _bb07
:call bb07

: bd07
:call bxyn
return
: _bd07
:call bd07

: b107
:call bxyn
return
: _b107
:call b107

: _handheld

# patch chip-8x code for debugging
i := _bedf
load v1
i :=  _c4x4l
save v1

i := _b2d7
load v1
i := __tgretv0
save v1
i := __tgretv1
save v1

i := _b707
load v1
i := _color
save v1

i := _b907
load v1
i := _bbc8:0
save v1
i := _bbc8:4
save v1

i := _bb07
load v1
i := _bbc8:1
save v1
i := _bbc8:5
save v1

i := _bd07
load v1
i := _bbc8:2
save v1
i := _bbc8:6
save v1

i := _b107
load v1
i := _bbc8:3
save v1
i := _bbc8:7
save v1

hires
:call reset

#vd := 0
#ve := 255
# i := draw,z,a,p
# load vb
#:call draw
# i := draw,z,b,p
# load vb
#:call draw
#
#i := ff11
#vd := 32
#vc := 32
#vb := 43
#va := 54
#
#: invert_loop
#sprite vd vc 11
#sprite vd vb 11
#sprite vd va 10
#if vd == 56
#then jump inverted
#vd += 8
#jump invert_loop
#
#: inverted
#i := isym0
#vc += 1 # gives a nice box effect
#sprite vd vc 7

jump root

return

:assert "handheld entry polint too large" { HERE <= 0x300 }

:org 0x300  # 2 page CHIP-8X
# differs from 02A0 on RCA's CHIP-8X
:byte 0x02 0xf0   # black on black

vf := 0
: ff
buzzer := vf

# these two patches:
# VIPER v3 #4 3.04.05
# VIPER v1 #2 p19
v0 := 0xec  # SEC, 2 cycles

# have sprite just copy instead of xor
i := 0xbf
#save v0
:byte 0xf0
: h55
:byte 0x55

dnl this second location is not needed when sprites are aligned
dnl plus it causes flicker and a bug in the lower page display
dnl i := 0xcf
dnl save v0

# don't wait for VBLANK, replace IDLE with next instruction
i := 0xac
save v0

# don't wait for VBLANK in BXYN, replace IDLE with nop
# this can cause a slight visual disturbance as columns are momentarily
# shifted up slightly
v0 := 0xc4  # CONT, 3 cycles
i := 0x25a
save v0

# colormap at 0xc00 on 1862/1864
# use these registers on ETI-660 https://chip-8.github.io/extensions/#chip-8x

ve := 32
vd := 7     # white
:call c4x4

ve := 0
vd := 0     # black
:call c4x4

:call reset

ve := 0
vd := 2     # blue
:call c4x4

dnl : forever
dnl vf := key
dnl jump forever

v1 := 63
i := h55
v0 := 48
sprite v0 v1 1
v0 := 56
sprite v0 v1 1

jump root

dnl 2p CHIP-8X does not support BXY0, use BXYN instead
: c4x4
vf := 120

: _c4x4l
:byte 0xbe 0xdf

if vf == 0
then return

ve += 66
vf -= 8
jump _c4x4l


:assert "chip-8x entry polint too large" { HERE <= 0x600 }

dnl need extra headroom for testing
#jump _entry_point
#
#:org 0x600  # ETI660
#v0 := 0
#buzzer := v0

: _entry_point
