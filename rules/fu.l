#!/bin/sh

rules4='/etc/iptables/rules.v4'
rules6='/etc/iptables/rules.v6'
filog='/var/log/drop.iptables.log'
tabl="mangle"
mee="$mee"
function restore4(){
	iptables -t $tabl -nvL --line-numbers | awk '{if($2>0) print}'|grep 'DROP' | tee -a $filog 1>/dev/null
	iptables -F
	iptables-nft-restore < $rules4
}
function restore6(){
	ip6tables -t $tabl -nvL --line-numbers | awk '{if($2>0) print}'|grep 'DROP' | tee -a $filog 1>/dev/null
	ip6tables -F
	ip6tables-nft-restore < $rules6
}
function save4(){
	iptables-nft-save > $rules4
}
function save6(){
	ip6tables-nft-save > $rules6
}
function uniq4(){
	a4=`iptables-nft -t $tabl -S $mee |grep '\-A'|sort| uniq -d|awk '{print $4}'|awk -F '/' '{print $1}'`
for i in $a4 ;do
        if [ ! -z $i ];then
        sed -Ei "/$i\/(32|24) -j DROP/d" $rules4
	echo -n '-' $i '- '
        fi
done
restore4
for j in $a4 ;do
        if [ ! -z $j ];then
        iptables-nft -t $tabl -A $mee -d $j -p all -j DROP 2>/dev/null
	echo -n '+' $j '+ '
        fi
done
unset a4
save4
	sed -i '/0.0.0.0/d' $rules4
	echo ' 0.0.0.0' $?
	restore4
}
function uniq6(){
	a6=`ip6tables-nft -t $tabl -S $mee |grep '\-A'|grep ':'|sort| uniq -d|awk '{print $4}'|awk -F '/' '{print $1}'`
for i in $a6 ;do
        if [ ! -z $i ];then
        sed -i "/-d $i\/128 -j DROP/d" $rules6
        echo -n '-' $i '- '
        fi
done
restore6
for j in $a6 ;do
        if [ ! -z $j ];then
        ip6tables-nft -t $tabl -A $mee -d $j -p all -j DROP 2>/dev/null
        echo -n '+' $j '+ '
        fi
done
unset a6
save6
sed -i '/-d ::\/128/d' $rules6
echo ' ::/128' $?
restore6
}
function delete4(){
	if [ -z $1 ];then
        	exit
	fi
a=`cat $1`
	if [ ! -f $1 ];then
		exit
	fi
for i in $a;do
        sed -Ei "/$i\/(32|24) -j DROP/d" $rules4
        echo $i $? '--'
done
unset a
restore4
}
function delete6(){
	if [ -z $1 ];then
        	exit
	fi
a=`cat $1`
	if [ ! -f $1 ];then
		exit
	fi
for i in $a;do
        sed -i "/$i\/128 -j DROP/d" $rules6
        echo $i $? '--'
done
restore6
}
function uniq24(){
	a24=`iptables -t $tabl -S $mee|grep '\-d'|grep '/24'|awk '{print $4}'|sed -n 's/\.0\/24$//p'`
for i in $a24;do
        aa=`iptables -t $tabl -S $mee|grep '\-d'|grep "$i"|grep '/32'|awk '{print $4}'|sed -n 's/\/32$//p'`
if [ ! -z $aa ];then
        for j in $aa;do
        sed -i "/$j\/32 -j DROP/d" $rules4
        echo '--' $j $?
        done
else
        echo -n 'null' $?
fi
        echo " " $i $? '--'
done
unset a24 aa
restore4
}
function addl4(){
stt='-A $mee'
	lams=`sed -n "/$stt/p" $rules4|wc|awk '{print $1}'`
	save4
	lame=`sed -n "/$stt/p" $rules4|wc|awk '{print $1}'`
	echo $lams '-' $lame
	sed -n "/$stt/p" $rules4|sed -n "$(( lams + 1 )),${lame}p"|grep '\-d'
	unset lams lame stt
}
function addl6(){
stt='-A $mee'
	lams=`sed -n "/$stt/p" $rules6|wc|awk '{print $1}'`
	save6
	lame=`sed -n "/$stt/p" $rules6|wc|awk '{print $1}'`
	echo $lams '-' $lame
	sed -n "/$stt/p" $rules6|sed -n "$(( lams + 1 )),${lame}p"|grep '\-d'
	unset lams lame stt
}
