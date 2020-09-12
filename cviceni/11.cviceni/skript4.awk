#!/usr/bin/awk -f

NR % 10 == 0 {
	print $0
}

