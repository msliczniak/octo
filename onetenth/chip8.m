include(loop.m)dnl
dnl
dnl GT(n, m)
dnl
define(`GT',`dnl
# if ($1 > $2)
  vF := $2
  vF -= $1
  if vF == 0')dnl
dnl
define(`__CHIP8_R0',  `v0`'')dnl
define(`__CHIP8_R1',  `v1`'')dnl
define(`__CHIP8_R2',  `v2`'')dnl
define(`__CHIP8_R3',  `v3`'')dnl
define(`__CHIP8_R4',  `v4`'')dnl
define(`__CHIP8_R5',  `v5`'')dnl
define(`__CHIP8_R6',  `v6`'')dnl
define(`__CHIP8_R7',  `v7`'')dnl
define(`__CHIP8_R8',  `v8`'')dnl
define(`__CHIP8_R9',  `v9`'')dnl
define(`__CHIP8_R10', `va`'')dnl
define(`__CHIP8_R11', `vb`'')dnl
define(`__CHIP8_R12', `vc`'')dnl
define(`__CHIP8_R13', `vd`'')dnl
define(`__CHIP8_R14', `ve`'')dnl
dnl
dnl REGS(regset, oregset)
dnl
define(`REGS', `dnl
  # REGS $*
pushdef(`__CHIP8_REGS_'`$1', $2)dnl')dnl
dnl
dnl PUSHREG(regset, name)
dnl
define(`PUSHREG', `dnl
pushdef(`rs', __CHIP8_REGS_$1)dnl
ifelse(rs, `15', `errprint(`PUSHREG: too many registers: $*
')m4exit(1)')dnl
pushdef(`$2', `__CHIP8_R'rs)dnl
pushdef(`__CHIP8_REGS_$1', `$2')dnl
`  # PUSHREG '$2` $*'dnl
pushdef(`__CHIP8_REGS_$1', incr(rs))dnl
popdef(`rs')dnl
')dnl
define(`REGSLVL', `__CHIP8_REGS_$1')dnl
dnl
dnl POPREGS(regset, oregset)
dnl
define(`POPREGS', `dnl
  # POPREGS $*
FOR(`IX', $2, `decr(__CHIP8_REGS_$1)', `dnl
	popdef(`__CHIP8_REGS_$1')dnl
	popdef(defn(`__CHIP8_REGS_$1'))dnl
	popdef(`__CHIP8_REGS_$1')'dnl
)dnl
dnl ifelse(`__CHIP8_REGS_$1', $2, popdef(`__CHIP8_REGS_$1'))dnl
')dnl
dnl
dnl vim: set filetype=m4: #modeline
