#!/bin/bash
# GNU bash, version 5.2.15(1)-release
# $1 "user.name" ,$2 "user.email" ,$3 "ssh-keygen -t"
case "$1" in
	* ) echo -e "help: bash $0 \$1 \$2\n\$1,name \$2,email";;
esac
if [ -e ./_$0 ] || [ -z "$1" ] || [ -z "$2" ] || [ -z "$3" ];then
	exit;
fi
if [ ! -d ./.git ];then
	git init;
fi
git config --global user.name $1
git config --global user.email $2
gpg --full-generate-key
gpg --list-sigs
longkey=` gpg --list-sigs | awk 'NR==4{print $1}' `
commitdate=` date +%Y%m%d%H%M%s%z `
case "$3" in
	dsa)
		ssh-keygen -a 1000 -t dsa -C "$commitdate" ;;
	ecdsa)
		ssh-keygen -a 1000 -t ecdsa -C "$commitdate" ;;
	rsa)
		ssh-keygen -a 1000 -b 4096 -t rsa -C "$commitdate" ;;
	*)
		ssh-keygen -a 1000 -t ed25519 -C "$commitdate" ;;
esac
gpg --armor --export $longkey
git config --global commit.gpgsign true
git config --global user.signingkey $longkey
git config --list
stat .git > ./_$0
