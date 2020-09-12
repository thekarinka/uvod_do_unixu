#!/bin/sh

sirka=8
vyska=8

hracX=1
hracY=1

hrac="X"

#IFS=""


switchSymbol(){
	if [ $hrac == "X" ]; then
		hrac="O"
	else
		hrac="X"
	fi
}

radekHvezdicek() {
	for i in `seq 1 $1`; do
		printf "*"
	done;
	printf "\n"
}

getPolicko() {

#	tmp="policko$1_$2"
#	vysledek="$(eval echo "\$$tmp")"
	vysledek="$(eval echo "\$policko$1_$2")"
	
	tmp=${vysledek:-" "}
	if [ $hracX == $1 -a $hracY == $2 ]; then
		printf "\033[41m$tmp\033[0m\n"
	else
		printf "$tmp"
	fi

}

checkFreePlace() {
#TODO
#	if [ 
	return 0
}

printPlocha() {
	radekHvezdicek $((4*$sirka+1))
	for i in `seq 1 $vyska`; do
		# řádek
		for j in `seq 1 $sirka`; do
			printf "* `getPolicko $i $j` "
		done
		printf "*\n"
		radekHvezdicek $((4*$sirka+1))
	done
}


# main loop
stty -echo
clear
printPlocha
while read -rn1 znak; do
	case $znak in
		"Q"|"q"*)
			stty echo
			exit 0
		;;
		"D"|"d"*)
			echo "šipka vpravo"
			hracY=$((hracY+1))
		;;
		"A"|"a"*)
			echo "šipka doleva"
			hracY=$((hracY-1))
		;;
		"W"|"w"*)
			echo "šipka nahoru"
			hracX=$((hracX-1))
		;;
		"S"|"s"*)
			echo "šipka dolů"
			hracX=$((hracX+1))
		;;
		" "|"b"*)
			echo "mezernik"
			if checkFreePlace $hracX $hracY; then
				eval "policko$hracX""_$hracY"="$hrac"
				switchSymbol
				checkWin $hracX $hracY
			fi
		;;
	esac
	clear
	printPlocha
done
stty echo
