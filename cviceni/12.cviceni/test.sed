#!/bin/sed -nf

1~5 {
	s/usr/XXX/
}
0~5 {
	s/usr/YYY/
}
/Solid/ d
0~10,3~10 s/[0-9]/ /g

