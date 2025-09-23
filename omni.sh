#!/bin/bash
# $1,source $2,file $3,^$ $4,name
if [[ -z $4 ]];then
       exit
fi
num=`wc $2|awk '{print $1}'`
pr="f-"
set -x
sed -i '/^$/d' $1
sed -i '/^$/d' $2
for i in `seq 1 $num`;do
	cp $1 ${pr}$i
done
#
b=0
while IFS= read -r line
do
	sed -i "s/$3/${line//&/\\&}/g" ${pr}$((++b))
done < "$2"
#
for k in {1..9};do
        cat ${pr}${k}* > "$4"${k}
        rm ${pr}${k}*
done
set +x
