#!/usr/bin/awk -f

{
	radek = "";
	for(i = NF; i > 0; i--)
		radek = radek " " $i
	print radek
}
