#!/usr/bin/awk -f
#
# convert lady[01].pbm shroom[01].pbm wolf[01].pbm flareon[01].pbm -depth 1 gray:- | xxd -c 30 -b
#

BEGIN {
	if (ARGC < 2) exit 1

	cmd = "convert"
	for (i = 1; i < ARGC; i++) {
		fn = ARGV[i]
		gsub(/'/, "'\''", fn)
		cmd = cmd " '" fn "'"
	}
	cmd = cmd " -depth 1 gray:- | xxd -c30 -g0 -b"
	#print cmd; exit

	while ( ( cmd ) | getline ) {
		n = split($2, a, "")
		for (i = 1; i <= n; i++) printf(" %s", a[i])
		print ""
	}

	exit(0)
}
