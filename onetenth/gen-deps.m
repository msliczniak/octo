errprint(NAME`.m 'NAME`.deps : Makefile Makefile.deps pp.sh deps.sh
')dnl
define(`m4_include', defn(`include'))dnl
define(`include', `dnl
errprint(NAME`.m 'NAME`.deps : $1
')dnl
m4_include(`$1')dnl
')dnl
m4_include(NAME`.m4')
dnl
dnl vim: set filetype=m4: #modelineo
