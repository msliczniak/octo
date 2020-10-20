errprint(NAME`.m 'NAME`.deps : Makefile Makefile.deps pp.sh deps.sh ideps.awk
')dnl
define(`m4_include', defn(`include'))dnl
define(`include', `dnl
syscmd(`"$MAKE" $MFLAGS -f Makefile.deps $1')dnl
ifelse(sysval, 0, , `m4exit(sysval)')dnl
errprint(NAME`.m 'NAME`.deps : $1
')dnl
m4_include(`$1')dnl
')dnl
m4_include(NAME`.m4')
