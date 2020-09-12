#!/bin/sh

mkdir sorted
sort beverly_hills.txt > sorted/beverly_hills.txt
sort actor.txt > sorted/actor.txt
sort social.txt > sorted/social.txt

join -t: sorted/beverly_hills.txt sorted/actor.txt > sorted/firstHalf.txt
join -t: sorted/firstHalf.txt sorted/social.txt

rm -rf sorted
