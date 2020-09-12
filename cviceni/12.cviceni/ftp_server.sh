#/bin/sh

echo "220 ahoj"
prihlaseny=0
nc_pid=0

random_port() {
	local x
	x=$(($RANDOM % 65536))
	while [ $x -lt 1024 -o $x -gt 65535 ]; do
		x=$(($RANDOM % 65536))
	done
	echo $x
}

while read CMD ARG; do
	case $CMD in
		USER)
			if [ "$ARG" == "anonymous" ]; then
				echo "230 login success"
				prihlaseny=1
			else
				echo "530 bad login"
			fi
			;;
		PASS)
			if [ $prihlaseny -eq 1 ]; then
				echo "230 already logged in"
			else
				echo "530 use USER first"
			fi
			;;
		PWD)
			echo "257" `pwd`
			;;
		CWD)
			if cd "$ARG" 2>/dev/null; then
				echo "250 success"
			else
				echo "550 fail"
			fi
			;;
		EPSV)
			FIFO=/tmp/ftp_fifo.$RANDOM
			mkfifo $FIFO
			port=`random_port`
			nc -l -p $port <$FIFO &
			nc_pid=$!
			exec 3<>$FIFO
			echo "229 ok (|||$port|)
			;;
		TYPE)
			echo "200 ok"
			;;
		LIST)
			echo "150 sending dir"
			ls -l | tail -n +2 >&3
			echo "226 sent"
			exec 3>&-
			kill $nc_pid
			rm $FIFO
			;;
		QUIT)
			echo "221 goodbye"
			break
			;;
		*)
			echo "500 unknown command"
			;;
	esac
done

exit 0

