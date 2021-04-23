#!/bin/sh

# relaunch in awk
{
	"test" "-n" "$1" && "exec" "/usr/bin/awk" "-f" "$0" "$1" "$0"
	"echo" "Usage: $0 pbm" >"/dev/stderr"
	"exit" "1"
}

# -channel G -separate -depth 2 -interlace plane gray:

BEGIN {
	#print ARGC
	#for (i in ARGV) print i, ARGV[i]
	#print ENVIRON["_"]
	#for (i in ENVIRON) print i, ENVIRON[i]
	#( "/bin/sh -c 'exec /bin/ps -p $PPID -o args='" ) | getline
	#print $0
	#exit

	# ENVIRON["_"] is not portable, get the script filename
	#cmd = "/bin/sh -c 'exec 2>&- /bin/ps -p $PPID -o args='"
	#if ( ( cmd ) | getline ) prog = $3
	#else prog = "pgm2pbms.awk"
	#close(cmd)

	prog = ARGV[2]
	ARGC = 2

	#print prog
}

NR == 1 {
	print prog

	i = match(FILENAME, "/[^/]*")
	print i
	exit
}
