dnl https://mbreen.com/m4.html#toc19
define(`FOR',`ifelse($#,0,``$0'',`ifelse(eval($2<=$3),1,
`pushdef(`$1',$2)$4`'popdef(`$1')$0(`$1',incr($2),$3,`$4')')')')dnl
dnl
define(`FE_',`ifelse(eval($#>2),1, `pushdef(`$1_',eval($#==3))dnl
`'pushdef(`$1',`$3')$2`'popdef(`$1')dnl
`'popdef(`$1_')dnl
`'ifelse(eval($#>3),1,`$0(`$1',`$2',shift(shift(shift($@))))')')')dnl
dnl
define(`WHILE',`ifelse($#,0,``$0'',eval($1+0),1,`$2`'$0($@)')')dnl
