define(`RELFILE', `dnl
pushdef(`__REL_NUM', 0)dnl
pushdef(`__REL_FILE', `$1')dnl
syscmd(`/bin/rm -f '__REL_FILE)dnl
ifelse(sysval, 0, , `m4exit(sysval)')dnl
')dnl
define(`RELDUMP',`dnl
undivert`# RELOCATIONS'
syscmd(`/bin/cat '__REL_FILE)dnl
ifelse(sysval, 0, , `m4exit(sysval)')dnl
popdef(`__REL_FILE')dnl
popdef(`__REL_NUM')dnl
')dnl
define(`EPA', `dnl emit page address
:calc rel@'__REL_NUM` { HERE }
:org { HERE + 1 } # :byte ( '$1` ) & 255
syscmd(`echo ":org { rel@'__REL_NUM` } :calc addr { ( '$1` ) & 255 } :byte addr" >>'__REL_FILE)dnl
ifelse(sysval, 0, , `m4exit(sysval)')dnl
pushdef(`N', incr(__REL_NUM))dnl
popdef(`__REL_NUM')dnl
pushdef(`__REL_NUM', N)dnl
popdef(`N')dnl
')dnl
define(`SEI', `dnl
:calc rel@'__REL_NUM` { HERE }
:org { HERE + 2 } # i := '$1`
syscmd(`echo ":org { rel@'__REL_NUM` } :calc addr { '$1` } i := addr" >>'__REL_FILE)dnl
ifelse(sysval, 0, , `m4exit(sysval)')dnl
pushdef(`N', incr(__REL_NUM))dnl
popdef(`__REL_NUM')dnl
pushdef(`__REL_NUM', N)dnl
popdef(`N')dnl
')dnl
define(`SIL', `dnl
:calc rel@'__REL_NUM` { HERE }
:org { HERE + 4 } # i := '$1`
syscmd(`echo ":org { rel@'__REL_NUM` } :calc addr { '$1` } i := long addr" >>'__REL_FILE)dnl
ifelse(sysval, 0, , `m4exit(sysval)')dnl
pushdef(`N', incr(__REL_NUM))dnl
popdef(`__REL_NUM')dnl
pushdef(`__REL_NUM', N)dnl
popdef(`N')dnl
')dnl
