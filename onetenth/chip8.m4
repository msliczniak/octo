include(loop.m4)dnl
dnl
dnl GT(n, m)
dnl
define(`GT',`dnl
# if ($1 > $2)
  vF := $2
  vF -= $1
  if vF == 0')dnl
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
ifelse(_$1, `15', `errprint(`too many registers: $*
')m4exit(1)')dnl
define($2, `r'_$1)dnl
`  # PUSHREG $*' `r'_$1 dnl
define(`_$1'_$1, `$2')dnl
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
:alias r0 v0
:alias r1 v1
:alias r2 v2
:alias r3 v3
:alias r4 v4
:alias r5 v5
:alias r6 v6
:alias r7 v7
:alias r8 v8
:alias r9 v9
:alias r10 va
:alias r11 vb
:alias r12 vc
:alias r13 vd
:alias r14 ve
