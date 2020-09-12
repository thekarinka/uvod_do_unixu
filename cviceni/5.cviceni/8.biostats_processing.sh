#!/bin/sh

vypocet() {
	local pocet_m pocet_f age_sum h_sum w_sum
	pocet_m=0
	pocet_f=0
	age_sum=0
	h_sum=0
	w_sum=0
	IFS=","

	while read name sex age h w; do
		if [ "$sex" == "F" ]; then
			pocet_f=$((pocet_f+1))
		elif [ "$sex" == "M" ]; then
			pocet_m=$(($pocet_m + 1))
		fi
	

	done

	echo "žen: $pocet_f, mužů: $pocet_m"
	echo "Průměrný věk: ..."

}


cat biostats.csv | tr -d ' "' | vypocet


