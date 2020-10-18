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
define(`_R0',  `v0`'')dnl
define(`_R1',  `v1`'')dnl
define(`_R2',  `v2`'')dnl
define(`_R3',  `v3`'')dnl
define(`_R4',  `v4`'')dnl
define(`_R5',  `v5`'')dnl
define(`_R6',  `v6`'')dnl
define(`_R7',  `v7`'')dnl
define(`_R8',  `v8`'')dnl
define(`_R9',  `v9`'')dnl
define(`_R10', `va`'')dnl
define(`_R11', `vb`'')dnl
define(`_R12', `vc`'')dnl
define(`_R13', `vd`'')dnl
define(`_R14', `ve`'')dnl
dnl
dnl REGS(regset, oregset)
dnl
define(`REGS', `dnl
  # REGS $*
pushdef(`_'`$1', $2)dnl')dnl
dnl
dnl PUSHREG(regset, name)
dnl
define(`PUSHREG', `dnl
ifelse(_$1, `15', `errprint(`PUSHREG: too many registers: $*
')m4exit(1)')dnl
pushdef($2, `_R'_$1)dnl
`  # PUSHREG 'defn(`_R'`'_$1)` $*'dnl
define(`_$1', incr(_$1))dnl
')dnl
dnl
dnl POPREGS(regset, oregset)
dnl
define(`POPREGS', `dnl
  # POPREGS $*
FOR(`IX', $2, `decr(_$1)', `dnl
	popdef(defn(`_$1'`'IX))dnl
	popdef(`_$1'`'IX)'dnl
)dnl'
popdef(`$1')dnl
)dnl
dnl
dnl vim: set filetype=m4: #modeline
