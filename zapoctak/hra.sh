#!/bin/sh

FOREGROUND_COLOR="\033[94m"
BCK_COLOR="\033[40m"
O_FOREGROUND_COLOR="\\033[32m"
X_FOREGROUND_COLOR="\\033[33m"

sirka=${1:-"10"}
vyska=${2:-"10"}
pocetPiskvorek=${3:-"4"}
hracX=1
hracY=1

hrac="X"

pocetPolicekNaDiagonale(){
	# $1, $2 - pozice
	# $3, $4 - směrový vektor
	# $5 - 1 - s rekurzí, 0 bez
	# vrátí počet políček v diagonále

	znak="$(eval echo "\$policko$1_$2")"

	x=$(($1+$3))
	y=$(($2+$4))

	inc=0

	while [ "$(eval echo "\$policko"$x"_"$y"")" == $znak ]; do
		inc=$(($inc+1))
		x=$(($x+$3))
		y=$(($y+$4))
	done

	if [ $5 == "1" ]; then
		druhaStrana=`pocetPolicekNaDiagonale $1 $2 $((-1*$3)) $((-1*$4)) 0`
		v=$(($inc+$druhaStrana+1))
		echo $v
	else
		echo $inc
	fi
}

checkWin(){
	# $1 - políčko X,	$2 - políčko Y
	p1=`pocetPolicekNaDiagonale $1 $2 -1 0 1`
	p2=`pocetPolicekNaDiagonale $1 $2 -1 -1 1`
	p3=`pocetPolicekNaDiagonale $1 $2 0 -1 1`
	p4=`pocetPolicekNaDiagonale $1 $2 1 -1 1`
	nejvyssi=`printf "%d\n%d\n%d\n%d\n" "$p1" "$p2" "$p3" "$p4" | sort -r | head -n 1`
	
	echo $nejvyssi
}

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

printPolicko() {
	vysledek="$(eval echo "\$policko$1_$2")"
	
	tmp=${vysledek:-" "}
	if [ $hracX == $1 -a $hracY == $2 ]; then
		printf "\033[41m"
	fi
	
	if [[ $tmp == "O" ]]; then
		printf "$O_FOREGROUND_COLOR$tmp$FOREGROUND_COLOR$BCK_COLOR"
	elif [[ $tmp == "X" ]]; then
		printf "$X_FOREGROUND_COLOR$tmp$FOREGROUND_COLOR$BCK_COLOR"
	else
		printf "$tmp$FOREGROUND_COLOR$BCK_COLOR"
	fi
}

checkFreePlace() {
	znakPolicko="$(eval echo "\$policko$1_$2")"
	x="X"
	o="O"
	if [ "$znakPolicko" = "$x" -o "$znakPolicko" = "$o" ]; then
		return 1
	else
		return 0
	fi
}

printPlocha() {
	radekHvezdicek $((4*$sirka+1))
	for i in `seq 1 $vyska`; do
		# řádek
		for j in `seq 1 $sirka`; do
			printf "* `printPolicko $i $j` "
		done
		printf "*\n"
		radekHvezdicek $((4*$sirka+1))
	done
	printf "Hraje hráč $hrac\n"
}

konec() {
	read
	if [ -t 0 ] ; then
		:
	else
		stty echo
	fi
	exit 0
}


# main loop
tput civis; trap "tput reset" EXIT
stty -echo
printf $BCK_COLOR$FOREGROUND_COLOR
clear
printPlocha
while read -rn1 znak; do
	case $znak in
		"Q"|"q"*)
			konec
		;;
		"D"|"d"*)
			#echo "šipka vpravo"
			hracY=$((hracY+1))
		;;
		"A"|"a"*)
			#echo "šipka doleva"
			hracY=$((hracY-1))
		;;
		"W"|"w"*)
			#echo "šipka nahoru"
			hracX=$((hracX-1))
		;;
		"S"|"s"*)
			#echo "šipka dolů"
			hracX=$((hracX+1))
		;;
		" "|"b"*)
			#echo "mezernik"
			if checkFreePlace $hracX $hracY; then
				eval "policko$hracX""_$hracY"="$hrac"
				winVysledek=`checkWin $hracX $hracY`
				if [ $winVysledek -ge $pocetPiskvorek ]; then
					clear
					printPlocha
					echo "Vyhrál hráč s $hrac"
					echo "Stiskněte Enter"
					read
					konec
				fi
				switchSymbol
			fi
		;;
	esac
	clear
	printPlocha
done
#konec