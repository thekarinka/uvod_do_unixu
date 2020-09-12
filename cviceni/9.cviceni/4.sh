#/bin/sh

# nefunguje na skryté soubory (nutno použít find)

for file in *
do mv "$file" "`echo "$file" | tr "[:lower:]" "[:upper:]"`"
done	

# echo $file by měl být v uvozovkách, protože echo odstraňuje duplicitní mezery, např.
