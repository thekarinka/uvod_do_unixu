#/bin/sh

i=$1
up=$(($2+1))
while [ $i -lt $up ]; do
	printf "%0$3d\n" $i
	i=$(($i+1))
done
