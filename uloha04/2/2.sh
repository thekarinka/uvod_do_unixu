#!/bin/sh

mkdir sorted
#sort -t; -k 1 countrycodes_en.csv > sorted/countrycodes_en.csv
#sort -t; -k 4 kodyzemi_cz.csv > sorted/kodyzemi_cz.csv
cut -d \; -f 4 kodyzemi_cz.csv | tr -d '"' | sort > sorted/kodyzemi_cz.csv
cut -d \; -f 1 countrycodes_en.csv | tr -d '"' | sort > sorted/countrycodes_en.csv 


join -t: sorted/countrycodes_en.csv sorted/kodyzemi_cz.csv

#rm -rf sorted
