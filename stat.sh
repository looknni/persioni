#!/bin/bash
# GNU bash, version 5.2.15(1)-release
case "$1" in
	* ) echo -e "help: bash $0 \$1\n\$1,[1..n]";;
esac
fill="o.$0"
# tmpd="Y.Qo"
function sstt(){
fils=` find -maxdepth $1 -type f | grep -v ".git" `
set -x
rm $fill
for i in $fils ;do 
	if [ -s $i ];then 
		echo `sha256sum $i` `stat -c '%s %W %X %Y %Z' $i` >> $fill;
	fi
done
set +x
# awk '{$2="";print NR,$0}' $tmpd > $fill 2>&1
}
sstt 2
