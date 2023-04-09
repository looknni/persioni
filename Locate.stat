#!/bin/bash
# GNU bash, version 5.2.15(1)-release
# $1,oldfile $2,maxdepth
case "$1" in
	* ) echo -e "help: bash $0 \$1 \$2\n\$1,File \$2,[1..n]" ;;
esac
if [[ -z $1 || -z $2 ]];then
	exit 2;
fi
stime=$(date +%s)
outf="_$0"
olistf="$1"
tmpdate="_tmp.date"
sess=1
looc=1
osdeb=`hostnamectl|grep -w "Operating System: Debian"`
osrpm=`hostnamectl|grep -w "Operating System: Rocky"`
find -maxdepth $2 -type f |grep -vE "$outf|$tmpdate" > $outf
listf=`cat $outf`
function sear(){
	cat ${olistf} |grep -w $1|sort|awk "NR==1{print \$$2,\$$3}" >> $tmpdate
}
function rdate(){
	date --date="@$1" +%k:%M:%S
}
for dd in $listf;do
if [ -s $dd ];then
	x=`stat -c %X $dd`;
	y=`stat -c %Y $dd`;
	z=`stat -c %Z $dd`;
if [[ ! -z $osdeb ]];then
	sear ${dd} 31 32;
	sear ${dd} 35 36;
	sear ${dd} 39 40;
fi
if [[ ! -z $osrpm ]];then
	sear ${dd} 33 34;
	sear ${dd} 37 38;
	sear ${dd} 41 42;
fi
if [[ $(uname -m) == "aarch64" ]];then
	sear ${dd} 29 30;
	sear ${dd} 33 34;
	sear ${dd} 37 38;
fi
tmpx=`cat $tmpdate|sed -n '1p'`
tmpy=`cat $tmpdate|sed -n '2p'`
tmpz=`cat $tmpdate|sed -n '3p'`
	
dtmpx=`date -d "${tmpx}" +%s`
dtmpy=`date -d "${tmpy}" +%s`
dtmpz=`date -d "${tmpz}" +%s`
dda=$((x-dtmpx))
if [ $dda -gt $sess ] || [ $dda -gt $sess ] || [ $dda -gt $sess ];then
	if [ $(($dda/3600)) -lt 1 ];then
	echo $dda"s" $dd $(rdate $x);
	elif [[ $(($dda/3600)) -gt 1 && $(($dda/3600)) -lt 24 ]];then
	echo $(($dda/3600))"h" $dd $(rdate $x);
	else
	echo $(($dda/86400))"d" $dd $(rdate $x);
	fi
fi
	ww=$((looc++))
	etime=$(date +%s)
	if [ $((ww % 1000)) -eq 0 ];then
		echo -e "\t$ww $((stime-etime))s";
	fi
fi
	cat $tmpdate > $tmpdate
done
rm $tmpdate $outf
