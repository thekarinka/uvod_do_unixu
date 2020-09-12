#!/bin/sh

gcd() {
   	local a=$1
	local b=$2
	while [ $a -ne $b ]; do
		if [ $a -gt $b ]; then
			a=$(($a - $b))
		elif [ $a -lt $b ]; then
			b=$(($b - $a))
		fi
	done
	echo $a
	return 0
}

echo `gcd $1 $2`
