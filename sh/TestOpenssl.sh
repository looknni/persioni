#!/bin/bash
# GNU bash, version 5.2.15(1)-release
case "$1" in
	*) echo -e "help: bash $0 \$1 \$2\n\$1,IN File \$2,OUT File";;
esac
if [[ -f $0$1 ]];then
	exit;
fi
str=`cat $1`
for i in $str;do
	echo $i | openssl enc -e $i -pass pass:$i -iter 1;
	echo "$?=$i" >> $2;
done
sed -i '1,2d' $2
noo=`cat $2|sort|grep "0="|wc|awk '{print $1}'`
sed -i "$noo a\ " $2
sed -i 's/^0=\|1=//g' $2
echo -e "\n"
awk '{xx=$0;if(NR % 5 != 0){ORS=" ";print($xx)}else{print("\n",$xx ,"")}}' $2|awk -v ORS="" '{print }'
stat $0 > $0$1
