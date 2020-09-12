#/bin/sh

printf $PATH | tr ":" "\n" | xargs ls -l -d
