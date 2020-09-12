#!/bin/sh

sirka=10
vyska=10

hracX=0
hracY=0

policko1_1="S"

# param: $1 - sirka, $2 - vyska
init() {
	for i in `seq 1 $1`; do
		for j in `seq 1 $2`; do
			mezera="X"
			eval policko$i_$j="x"
		done
	done
	echo $policko1_2
}

radekHvezdicek() {
	for i in `seq 1 $1`; do
		printf "*"
	done;
	printf "\n"
}

getPolicko() {
#	printf "${policko$1_$2}"
	tmp="policko$1_$2"
	
	vysledek="$(eval echo "\$$tmp")"
	
#	printf "$(eval echo "\$$tmp")"
	printf ${vysledek:-" "}
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
init 10 10
#clear
printPlocha
while read -rn1 znak; do
	clear
	printPlocha
	case $znak in
		"Q"|"q"*)
			exit 0
		;;
		"D"|"d"*)
			echo "šipka vpravo"
			exit 0
		;;
		"A"|"a"*)
			echo "šipka doleva"
		;;
		"W"|"w"*)
			echo "šipka nahoru"
		;;
		"S"|"s"*)
			echo "šipka dolů"
		;;
	esac
done
