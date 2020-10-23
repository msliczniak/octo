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

:org 0x600  # ETI660
v0 := 0
buzzer := v0

: _entry_point
