# defines.m4

define(`_', `$1$2$3$4$5$6$7$8$9')dnl

include(`chip8.m')

define(`BL',`0')

: main
v0 := 0
:breakpoint main
buzzer := v0
