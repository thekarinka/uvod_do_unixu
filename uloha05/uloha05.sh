#!/bin/sh

#1
find /etc/. -d 1 -ls | sort -k 7 -r | head -n 1

#2
find /var/. -ls | sort -k 7 -r | head -n 1

#3
ls /etc/. -la --time-style=+"%s" 2> /dev/null | sort -rk 6 | head -n 1

ls /etc/. -Rla --time-style=+"%s" 2> /dev/null | sort -rk 6 | head -n 1
