#!/usr/bin/awk -f

# -channel G -separate -depth 2 -interlace plane gray:

BEGIN {
	#print ARGC
	#for (i in ARGV) print i, ARGV[i]
	#print ENVIRON["_"]
	#for (i in ENVIRON) print i, ENVIRON[i]
	#( "/bin/sh -c 'exec /bin/ps -p $PPID -o args='" ) | getline
	#print $0
	#exit

	cmd = "/bin/sh -c 'exec 2>&- /bin/ps -p $PPID -o args='"
	if ( ( cmd ) | getline ) prog = $3
	else prog = "pgm2pbms.awk"
	close(cmd)

	print prog
}
