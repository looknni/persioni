#!/bin/bash
# $1,source $2,file
num=`wc $2|awk '{print $1}'`
set -x
for i in `seq 0 $num`;do
	cp $1 "f-"$i
done
#
a=`cat $2`
b=0
for j in $a;do
	sed -i "s/^/$j/g" 'f-'$((b++))
	echo $b
done
#
for k in {1..9};do
        cat f-${k}* > m2n${k}
        rm f-${k}*
done
set +x
