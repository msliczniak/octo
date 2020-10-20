#!/bin/sh
m4 -DNAME="$1" gen-deps.m 2>&1 >/dev/null | grep "^$1\.m $1\.deps : "
