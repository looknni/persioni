#!/bin/bash
# $1,source $2,file $3,name
if [[ -z $1 || -z $2 || -z $3 ]];then
	exit
fi
num=`wc $2|awk '{print $1}'`
set -x
for i in `seq 0 $num`;do
	cp $1 "f-"$i
done
#
a=`cat $2`
b=0
for j in $a;do
	sed -i "s/\$/$j/g" 'f-'$((b++))
done
#
for k in {1..9};do
        cat "f-"${k}* > "$3"${k}
        rm "f-"${k}*
done
set +x
