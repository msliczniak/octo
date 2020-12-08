#!/bin/sh

# handle no dependencies created yet
</dev/null exec
2>/dev/null <"$1".deps exec || exit 0

exec /usr/bin/awk '
# print implicit dependencies
NR != 1 { print $NF; next }

# sanity check
$1 != n".m" { exit 1 }
$2 != n".deps" { exit 1 }
$3 != ":" { exit 1 }
$4 != "Makefile" { exit 1 }
$5 != "Makefile.deps" { exit 1 }' n="$1"
