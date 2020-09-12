#!/usr/local/bin/awk -f

BEGIN {
	RS="<";
	FS=" ";
}
/^a\s/ {
	for(i = 1; i <= NF; i++){
	if($i ~ "^href="){
			gsub("/>", "", $i);
			gsub(">", "", $i);
			gsub("href=", "", $i);
			gsub("\"", "", $i)
			gsub("\&amp;", "\\\&", $i);
			gsub("\&guot;", "\"", $i);
			gsub("\&lt;", "<", $i);
			gsub("\&gt;", ">", $i);
			print $i;
		}
	}
}
