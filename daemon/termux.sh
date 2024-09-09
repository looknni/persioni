#!/bin/bash
# GNU bash, version 5.2.15(1)-release
case "$1" in
	*) echo -e "help: bash $0\nnew DNS && bash configure for termux\n"
cat << "EOF"
$PREFIX/etc/apt/sources.list
$PREFIX/etc/resolv.conf
$termuxhome/.termux/termux.properties
$termuxhome/.bashrc
EOF
;;
esac
termuxextrakeys="#ZXh0cmEta2V5cwo\nextra-keys = [['ESC','/','<','>','(',')','-','HOME','UP','END','PGUP'],['TAB','CTRL','{','}','[',']','BACKSLASH','LEFT','DOWN','RIGHT','PGDN']]"
termuxsourceslist="deb https://mirrors.ustc.edu.cn/termux/apt/termux-main stable main"
termuxhome="/data/data/com.termux/files/home"
if [ -f _$0 ];then
	exit
fi
function tffile() {
	if [ ! -e $1.bat ];then
		cp $1 $1.bat
	fi
}
tffile $PREFIX/etc/apt/sources.list
tffile $PREFIX/etc/resolv.conf
tffile $termuxhome/.termux/termux.properties
if [ ! -e $termuxhome/.bashrc ];then
	touch $termuxhome/.bashrc
fi
termuxpro=`grep "#ZXh0cmEta2V5cwo"  $termuxhome/.termux/termux.properties`
termuxrc=`grep "#Y2RkCg" $termuxhome/.bashrc`
echo $termuxsourceslist > $PREFIX/etc/apt/sources.list
cat > $PREFIX/etc/resolv.conf << "EOF"
nameserver 223.6.6.6
EOF
if [ -z "$termuxrc" ];then
cat >> $termuxhome/.bashrc << "EOF"
#Y2RkCg
PS1='\[\e[0;32m\]\W\[\e[0m\] \[\e[1;31m\]? \[\e[0m\]'
alias cdd="cd $PREFIX"
export HISTTIMEFORMAT='%F %T]$ '
PROMPT_COMMAND='history -a'
export LESS_TERMCAP_mb=$'\E[01;35m'
export LESS_TERMCAP_md=$'\E[01;35m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;37;40m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export GROFF_NO_SGR=1 #redhat
export LESS=-R #debian
EOF
fi
if [ -z "$termuxpro" ];then
echo -e $termuxextrakeys >> $termuxhome/.termux/termux.properties
fi
`source $termuxhome/.bashrc`
stat $0 > _$0
