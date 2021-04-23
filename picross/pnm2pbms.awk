#!/usr/bin/awk -f

# -channel G -separate -depth 2 -interlace plane gray:

BEGIN {
	#print ARGC
	#for (i in ARGV) print i, ARGV[i]
	#print ENVIRON["_"]
	#for (i in ENVIRON) print i, ENVIRON[i]
	#prog = ARGV[2]
	#ARGC = 2
	#print prog
	#exit

	# ENVIRON["_"] is not portable, get the script filename
	cmd = "/bin/sh -c 'exec 2>&- /bin/ps -p $PPID -o args='"
	if ( ( cmd ) | getline ) prog = $3
	else prog = "pnm2pbms.awk"
	close(cmd)

	if (ARGC != 2) {
		print "Usage: " prog " pnm[01].ext" >"/dev/stderr"
		exit(1)
	}

	# remove any path
	i = match(ARGV[1], "[^/]+$")
	if (i == 0) {
		print  prog ": not a file: " ARGV[1] >"/dev/stderr"
		exit(1)
	}

	base = substr(ARGV[1], i)
	print base

	# remove any extension, if result is empty next test will catch it
	i = match(base, /\.[^.]*$/)
	if (i-- != 0) base = substr(base, 1, i)
	else i = length(base)

	# get the unit number, 0 or 1
	unit = substr(base, i)

	# remove unit from base
	base = substr(base, 1, i - 1)

	print base, unit
	exit
}
