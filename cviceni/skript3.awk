#!/usr/bin/awk -f

BEGIN {
	i = 0
}
{
	print ++i " " NR" " $0	
}
