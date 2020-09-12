#!/bin/sh

IFS=";"
avg = 0
pocet = 0

while read name surname age; do
	echo "Name: $name"
	echo "Surname: $surname"
	echo "Age: $age"
	avg=$(($avg + $age))
	pocet=$(($pocet + 1))
done
echo $(($avg / $pocet))
