#!/usr/bin/awk -f

# -channel G -separate -depth 2 -interlace plane gray:

BEGIN {
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
		print prog ": not a file: " ARGV[1] >"/dev/stderr"
		exit(1)
	}

	base = substr(ARGV[1], i)
	#print base

	# remove any extension, if result is empty unit test will catch it later
	i = match(base, /\.[^.]*$/)
	if (substr(base, i) ~ /^\.[Pp][Bb][Mm]$/) {
		print prog ": cannot already be PBM: " ARGV[1] >"/dev/stderr"
		exit(1)
	}

	if (i-- != 0) base = substr(base, 1, i)
	else i = length(base)

	# get the unit number, 0 or 1
	unit = substr(base, i)
	if (unit == "0") sec = "1"
	else if (unit == "1") sec = "0"
	else {
		print prog ": unit number not 0 or 1: " ARGV[1] >"/dev/stderr"
		exit(1)
	}

	# remove unit from base
	base = substr(base, 1, i - 1)
	if (base == "") {
		print prog ": basename cannot be empty: " ARGV[1] >"/dev/stderr"
		exit(1)
	}

	# primary and secondary filenames
	pri = base unit ".pbm"
	sec = base sec ".pbm"

	#print pri, sec
	#exit
}

NR == 1 {
	if ($1 == "P2") stride = 1
	else if ($1 == "P3") stride = 3
	else {
		print prog ": not text PGM or PPM: " ARGV[1] >"/dev/stderr"
		exit(1)
	}

	# shell escape filenames
	i = pri
	gsub(/'/, "'\\''", i)
	cmd = "exec /bin/rm -f './" i "' './"
	i = sec
	gsub(/'/, "'\\''", i)
	cmd = cmd i "'"
	#print cmd; exit

	i = system(cmd)
	if (i != 0) {
		print prog ": failed to unlink PBMs: " ARGV[1] >"/dev/stderr"
		exit(1)
	}

	print "P1" >pri
	print "P1" >sec

	next
}

NR == 2 {
	print >pri
	print >sec

	next
}

NR == 3 {
	max = $1

	next
}

NF > 0 {
	i = 1
	for (;;) {
		cur = $(i - 1) " " $i " " $(i + 1)
		printf("%s", $i)

		i += stride
		if (i > NF) break

		printf(" ")
	}

	print ""
}
