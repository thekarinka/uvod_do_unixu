#/bin/sh

# musí se nastavit IFS na něco, co není v názvu souboru (ideálně třeba newline, ten tam sice může být, ale pak by se měl ten člověk údajně...)

for soubor in `find ./test -name "*.jpeg"`; do
	noveJmeno=`echo $soubor | sed 's/.jpeg$/.jpg/'`
	mv $soubor $noveJmeno
done
