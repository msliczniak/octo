dnl wslidy.m4 wide one tenth slidy game

define(`X0', 0)dnl  initial x pos
define(`Y0', 0)dnl  initial y pos
define(`XI', 16)dnl x increment
define(`YI', 8)dnl  y increment
dnl
define(`XF', `eval((XI*3) + X0)')dnl    final x pos
define(`YF', `eval((YI*3) + Y0)')dnl    final y pos
dnl
define(`SI', 15)dnl symbol sprite increment

include(`onetenth.m')
include(`wide.m')
include(`monitors.m')
