#!/bin/bash
# GNU bash, version 5.2.15(1)-release
case "$1" in
	*) echo -e "help: bash $0 \$1\n\$1,FilePath\n"
	echo "Search path : .pl ...."
	;;
esac
echo "\$1,ossystem"
if [[ -z $1 ]];then
	exit;
fi
dirfile="./$1$0/"
dfpath=("${dirfile}$1" )
extstr=".awk .sed .pl .sh .pm"
for dir in $extstr;do
	if [ ! -d ${dfpath[0]}${dir#.*} ];then
		mkdir -vp ${dfpath[0]}${dir#.*};
	fi
done
for s in $extstr;do
	locate ${s} | grep -E "${s}$" > ${dfpath[0]}${s}
	num=`cat ${dfpath[0]}${s} | wc | awk '{print $1}'`
	for((aa=1;aa < num+1;aa++));do
		aaa=`sed -n "${aa} p" ${dfpath[0]}${s}`
		filename=${aaa##*/}
		if [ -e ${dfpath[0]}${s#.*}/${filename} ];then
			cp -R ${aaa} ${dfpath[0]}${s#.*}/${filename}${aa};
		fi
		cp -R ${aaa} ${dfpath[0]}${s#.*}/
	done
	echo "${s#.*} `ls ${dfpath[0]}${s#.*}|wc`"
	echo "${s#.*}${s} `cat ${dfpath[0]}${s}|wc`"
done
