#!/usr/bin/awk -f

BEGIN {
	RS="<"
	cnt=0
}

/^a\s/ {
	print $1
	cnt++
}
END {
	print "počet linkov v subore " ARGV[1] ": " cnt
}
