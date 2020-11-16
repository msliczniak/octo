define(M, `define(`A', eval(I))dnl
define(`B', eval($1))dnl
define(`C', eval((-((1 + (I >> 8) + (I & 255) + $1) & 255)) & 255))dnl
A B C
define(`I', eval(I + 1))dnl')dnl
