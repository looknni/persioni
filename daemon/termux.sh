#!/bin/bash
cat > $PREFIX/etc/resolv.conf << 'RESO'
nameserver 223.6.6.6
RESO
cat >> ~/.termux/termux.properties << 'EXK'
extra-keys = [['ESC','<','>','(',')','HOME','UP','END','PGUP'],['TAB','CTRL','{','}','BACKSLASH','LEFT','DOWN','RIGHT','PGDN']]
EXK
cat >> ~/.bashrc << 'EOF'
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
pr=$(echo $RANDOM|md5sum)
(echo $pr; echo $pr) | passwd > /dev/null
cat ~/.bash_history > ~/.bash_history
cat ~/.ssh/known_hosts > ~/.ssh/known_hosts
cat ~/.ssh/known_hosts > ~/.ssh/known_hosts.old
EOF
