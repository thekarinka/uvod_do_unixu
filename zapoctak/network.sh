#!/bin/sh


PID=$$
action=$1
port=${2:-"4321"}
adresa=${3:-"127.0.0.1"}


if [ "$action" = "server" ]; then
	mkfifo roura
	( cat roura | ncat -l -p $port & cat ) | ./hra.sh | tee roura
	rm roura
elif [ "$action" = "client" ]; then
	ncat $adresa $port
else
	echo "This is help.\n\nControls\n- W, A, S, D - moving\n- B - mark place\nQ - quit\n- Enter - send command\n\nParams\n-\$1 - server / client / otherwise = help\n-\$2 - port\n-\$3 - address, empty means 127.0.0.1"
fi
