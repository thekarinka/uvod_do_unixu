#/bin/sh

# 1.

grep -e raven raven.txt

# 2.

grep -e ^$ raven.txt | wc -l

# 3.

grep -e '\(word\|more\|rav\)' raven.txt | wc -l

# 4.

grep -e 'p.*p.*ore' raven.txt

# 5.

grep -e '^[^A-Z].*$' raven.txt

# 6.

grep -e '^.*-$' raven.txt | wc -l

# 7.

grep -o -e '\b\w*ore' raven.txt

# 8.

grep -o -e '\b\(f\|F\)\w*' raven.txt

# 9.

grep -e '\(\b\w\)\w* \1' raven.txt
