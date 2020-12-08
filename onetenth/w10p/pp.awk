#!/usr/bin/awk -f
# preprocess
BEGIN { FS="" }
$0 !~ /^$/ && $0 !~ /dnl/ && $0 !~ /#/ { printf("%s\t#@@\t", $0) }
{ print  }
