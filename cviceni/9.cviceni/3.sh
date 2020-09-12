#/bin/sh

split -l 5 /etc/passwd pwlines
ls -r pwlines* | xargs cat
#rm pwlines*
