#!/bin/bash
# GNU bash, version 5.2.15(1)-release
case "$1" in
	*) echo -e "help: bash $0 \$1\n\$1,[1..n]\ncurrent path file:enc and denc ";;
esac
dirnew="./_$0"
datafile="$dirnew/_$0"
prikey="$dirnew/_private.key"
topopenssl="openssl dgst -sha256"
if [ ! -d $dirnew ];then
	mkdir -v $dirnew;
fi
if [ -z "$1" ];then
	exit;
fi
if [ ! -f $datafile ];then
	find -maxdepth $1 -type f |grep -vE "$0|$datafile" > $datafile;
fi
allfiles=`cat $datafile`
function eenc(){
	openssl enc -e -aes-128-cbc -in $1 -out $2 -pass pass:1 -pbkdf2
	chmod 0400 $2
}
function denc(){
	openssl enc -d -aes-128-cbc -in $1 -out $2 -pass pass:1 -pbkdf2
	chmod 0400 $2
}
function signx(){
$topopenssl -sign $1 -out $2 $3
	chmod 0400 $2 $3
}
if [ ! -f $prikey ];then
openssl genrsa -out $prikey 512;
	chmod 0400 $prikey;
fi
for ff in $allfiles;do
if [ ! -d ${dirnew}/${ff/\/${ff##*/}} ];then
	mkdir -p ${dirnew}/${ff/\/${ff##*/}};
fi
eenc $ff $dirnew/${ff#*/}
signx $prikey $dirnew/${ff#*/}.sign $dirnew/${ff#*/}
tar -cvf $dirnew/${ff#*/}.tar $dirnew/${ff#*/}*
rm -rf $dirnew/${ff#*/} $dirnew/${ff#*/}.sign
done
:'
echo -e "----------denc-----------\n"
find $dirnew -type f -name "*.tar" > $dirnew/_source
fdenc=`cat $dirnew/_source`
for fd in $fdenc;do
tar -xvf $fd --force-local 1>/dev/null 2>&1
$topopenssl -prverify $prikey -signature ${fd%.*}.sign ${fd%.*}
echo ${fd%.*}
denc ${fd%.*} ${fd%.*}.source
done
'
