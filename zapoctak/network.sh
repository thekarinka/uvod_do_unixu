#!/bin/sh

tput civis; trap "tput reset" EXIT

PID=$$
action=$1
sirka=${2:-"10"}
vyska=${3:-"10"}
pocetPiskvorek=${4:-"4"}
port=${5:-"4321"}
adresa=${6:-"127.0.0.1"}


if [ "$action" = "server" ]; then
	mkfifo roura
	( cat roura | ncat -l -p $port & while read -rn1 c; do echo "$c"; done ) | ./hra.sh $sirka $vyska $pocetPiskvorek | tee roura
	rm roura
elif [ "$action" = "client" ]; then
	while read -rn1 c; do 
		echo "$c"
	done | ncat $adresa $port
else
	echo "This is help.\n\nControls\n- W, A, S, D - moving\n- B - mark place\n- Q - quit\n- Enter - send command\n\nParams\n-\$1 - server / client / help (default help)\n-\$2 - width (default 10)\n-\$3 - height (default 10)\n-\$4 - count of symbols (default 4)\n-\$5 - port (default 4321)\n-\$6 - address (default 127.0.0.1)"
fi
