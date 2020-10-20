#!/bin/sh
SHELL=/bin/sh; export SHELL
m4 -DNAME="$1" gen-deps.m4 2>"$1".txt >/dev/null || exit
exec grep "^$1\.m $1\.deps : " <"$1".txt
