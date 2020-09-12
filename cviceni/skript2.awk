#!/usr/bin/awk -f

BEGIN {
	FS=","i;
	OFS=",";
}		
NR == 1 {
	# NF == 4 v priklade, chceme $5 = $ucet
	for(i = 2; i <= NF; ++i){
		sucty[i] = 0
	}
	x = NF+1
	$x = "Sucet"
	print
}
NR != 1 {
	sucet = 0
	for(i = 2; i <= NF; ++i){
		sucet += $i
		sucty[i] += $i
	}
	$x = sucet
	print
}
END {
	$1 = "Priemer"
	for(i = 2; i < x; ++i)
		$i = sucty[i] / (NR-1)
	NF = NF-1
	print
}
