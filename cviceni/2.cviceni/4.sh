# echo /afs/ms/u/?/*[aeiou]* > u1

find /afs/ms/u/. -mindepth 2 -maxdepth 2 -type d -printf '%f\n' | grep -e '^.[aeiou]' > u1
