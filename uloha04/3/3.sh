paste -d : <(
cut -d : -f 4 /etc/group | { 
while read line
 do
	 echo `echo $line | tr "," " "| wc -w`
	#echo $line
 done
 }
) <(cut -d : -f 4 /etc/group) | sort -r > sorted_group
grep $(head -n 1 sorted_group | cut -d : -f 1) sorted_group | cut -d : -f 2
rm sorted_group
