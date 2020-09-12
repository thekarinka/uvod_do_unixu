ls /etc/. -Rla --time-style=+"%s" | sort -rk 6 | grep -ve gls | head
