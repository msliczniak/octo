include(`rel.m4')dnl
RELFILE(`reltest.txt')dnl

: main

SIL(`bar - 4')
SEI(`bar + 2')

: foo
:byte 0 1 2 3

: bar
:byte 4 5 6 7

: baz
:byte 8 9

RELDUMP(`')dnl
