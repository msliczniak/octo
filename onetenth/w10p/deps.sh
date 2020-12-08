#!/bin/sh
SHELL=/bin/sh; export SHELL

m4 -DNAME="$1" gen-deps.m4 2>"$1".txt >/dev/null && \
  exec grep "^$1\.m $1\.deps : " <"$1".txt

>&2 tail -1 "$1".txt
exit 1
