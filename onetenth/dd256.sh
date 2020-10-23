#!/bin/sh

dd() {
	2>&1 /bin/dd bs=256 skip="$1" if="$2" of="$3" || return
	2>&1 echo
}

awk() {
	>&2 /usr/bin/awk 'END {
	if (NR == 0) exit 1
	if ($0 == "") exit 0
	print
	exit 1
}'
}

dd "$@" | awk
