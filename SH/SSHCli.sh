#!/bin/bash
# GNU bash, version 5.2.15(1)-release
case "$1" in
	*) echo -e "help bash $0 \$1 \$2 \$3 \$4 \$5\n\$1,username \$2,ip \$3,port \$4,SOURCEDIR \$5,DIRECTORY\n"
cat << "EOF"
rsync scp Connection Download Update
EOF
		;;
esac
if [[ -z "$1" ]];then
	exit;
fi
x64x="~/.ssh/know_hosts"
termuxx="/data/data/com.termux/files/home/.ssh/known_hosts"
if [[ $(uname -m) == "x86_64" ]];then
	cat $x64x > $x64x;
else
	cat  $termuxx > $termuxx;
fi
while true; do
    read -p "[C][U][D][ru][rd]: " ud
    case $ud in
        C ) ssh $1@$2 -v -p $3; break;;
        U ) scp -v -P $3 -r $4 $1@$2:$5;break;;
	D ) scp -v -r -P $3 $1@$2:$4 $5;break;;
	ru ) rsync -avP -e "ssh -p $3" --partial $4 $1@$2:$5;break;;
	rd ) rsync -avP -e "ssh -p $3" --partial $1@$2:$4 $5;break;;
        * ) echo "Please SELECT.";;
    esac
done
