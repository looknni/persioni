#!/bin/bash
# root login debian x86-64 rocky 8 9 x86-64
# RUN logname ALL=(ALL:ALL) ALL" /etc/sudoers ;laster
# yum groupinstall 'Server with GUI' @systemctl set-default
case "$1" in
	* ) echo -e "help: sudo bash $0"
cat << "EOF"
	Debian
/etc/apt/sources.list
/etc/apt/apt.conf.d/99nopipelining
/etc/sysctl.conf
~/.vimrc
~/.bashrc
/root/.vimrc
/root/.bashrc
/usr/share/gtksourceview-4/language-specs/powershell.lang
/etc/default/grub
/etc/hosts
/etc/NetworkManager/NetworkManager.conf
/usr/share/vim/vim82/colors/blue.vim
/etc/systemd/resolved.conf
	Rocky
/etc/yum.repos.d/*
/etc/sysctl.conf
/usr/share/vim/vim82/colors/blue.vim
~/.vimrc
~/.bashrc
/root/.vimrc
/root/.bashrc
/usr/share/gtksourceview-4/language-specs/powershell.lang
/etc/default/grub
/etc/hosts
/etc/hostname
/etc/default/grub
EOF
		;;
esac
function Teste(){
	ee=`grep -w $1 $2`
	if [ -z $ee ];then
	echo $1 >> $2
	echo $3 >> $2
	fi
	unset ee
}
function Tests(){
	se=`grep -w $1 $2`
	if [ -z $se ];then
	sed -i $3 $2
	fi
	unset se
}
function Batfun(){
	tmm=".bat"
	if [ ! -e $1${tmm} ];then
		sed -i${tmm} '' $1
	fi
	unset tmm
}
function Ddrc(){
	vimrcpath="/home/$lognamen/.vimrc"
	bashrcpath="/root/.bashrc"
	bashrcpathu="/home/$lognamen/.bashrc"
	vimrcpathf=`grep -w "\"aWYmZGlmZgo" $vimrcpath`
Teste "#UFMxCg" $bashrcpathu 'PS1="\[\e[0;32m\]\A \[\e[1;95m\]\W \[\e[1;33m\]\$ \[\e[0m\]"'
expsgr=`grep -w "export LESS=-R" $bashrcpathu`
if [ -z "$expsgr" ];then
cat >> $bashrcpathu << "EOF"
export HISTTIMEFORMAT='%F %T]$ '
export LESS_TERMCAP_mb=$'\E[01;35m'
export LESS_TERMCAP_md=$'\E[01;35m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;37;42m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export GROFF_NO_SGR=1 #redhat
export LESS=-R #debian

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
$(xrdb -load ~/.Xresources)
EOF
fi
unset -v expsgr
unset -v bashrcpath
unset -v bashrcpathu
if [ -z "$vimrcpathf" ];then
cat >> $vimrcpath << "EOF"
"aWYmZGlmZgo
syntax on
set cursorcolumn
"set cursorline
set laststatus=2
set statusline=\ %<%F\ [%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l\ %)
set hlsearch
set incsearch
set autoindent "redhat
set showmatch "redhat
set number "redhat
set mouse=a "redhat
set ai	"redhat
set autowrite "redhat
set t_Co=256 "redhat
colorscheme desert "delek "industry "murphy
hi statusline guibg=Cyan ctermfg=103 guifg=Black ctermbg=0
hi IncSearch    cterm=bold ctermfg=129 ctermbg=8
hi Search       cterm=bold ctermfg=148 ctermbg=8
if &diff
  	colorscheme blue
	hi Normal	guifg=yellow	guibg=darkBlue	ctermfg=yellow	ctermbg=none
	hi statusline guibg=Cyan ctermfg=103 guifg=Black ctermbg=0
endif
EOF
fi
unset -v vimrcpath
unset -v vimrcpathf
}

osdeb=`hostnamectl|grep -w "Operating System: Debian"`
if [ -n "$osdeb" ];then

lognamen=`logname`
aptsources="/etc/apt/sources.list"
Batfun ${aptsources}
cat > $aptsources << "EOF"
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
deb https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
deb https://mirrors.tuna.tsinghua.edu.cn/debian-security bookworm-security main contrib non-free non-free-firmware
deb-src https://mirrors.tuna.tsinghua.edu.cn/debian-security bookworm-security main contrib non-free non-free-firmware
EOF
	echo "Acquire::http::Pipeline-Depth \"0\";" > /etc/apt/apt.conf.d/99nopipelining
apt update -y
	apt autopurge fcitx* uim* xiterm+thai firefox-esr -y
	apt install -y vim-gtk kaffeine qbittorrent audacious git traceroute locate mtr \
fcitx fcitx-googlepinyin fcitx-table-wubi \
wget bash-completion obs-studio dnsutils \
nmap net-tools tcpdump audacity inkscape gimp krita audacity libreoffice
	`updatedb`
	Tests "#c3dhcHBpbmVzcwo" /etc/sysctl.conf '$a\#c3dhcHBpbmVzcwo\nvm.swappiness=20'
Ddrc
systemctl enable systemd-resolved.service
Batfun /etc/hosts
netmanager="/etc/NetworkManager/NetworkManager.conf"
Batfun ${netmanager}
cat > $netmanager << "EOF"
[main]
plugins=ifupdown,keyfile
#dns=dnsmasq
#systemd-resolved=true
#rc-manager=resolvconf

[ifupdown]
managed=true

[device]
wifi.scan-rand-mac-address=yes

[connectivity]
uri=
interval=0
EOF
unset -v netmanager
resolv="/etc/systemd/resolved.conf"
Batfun ${resolv}
cat > $resolv << "EOF"
DNS=119.29.29.29#dot.pub 2402:4e00::#dot.pub 223.5.5.5#dns.alidns.com 240c:f:1:22::6#dns.ipv6dns.com 180.76.76.76#dot.onedns.net 114.114.114.114#dot.onedns.net 1.2.4.8#dot-pure.onedns.net
#FallbackDNS=1.1.1.1#cloudflare-dns.com 8.8.8.8#dns.google 1.0.0.1#cloudflare-dns.com 8.8.4.4#dns.google 2606:4700:4700::1111#cloudflare-dns.com 2001:4860:4860::8888#dns.google 2606:4700:4700::1001#cloudflare-dns.com 2001:4860:4860::8844#dns.google 2620:fe::9 2620:fe::fe:9 2a09:: 2a11:: 2620:119:53::53 2620:119:35::35 2001:dc7:1000::1 2001:de4::101 2001:de4::102 2001:da8:8000:1:202:120:2:100 2001:da8:8000:1:202:120:2:101 2001:da8:ff:305:20c:29ff:fe1f:a92a 2a02:6b8::feed:ff 2a02:6b8:0:1::feed:ff 2a02:6b8::feed:bad 2a02:6b8:0:1::feed:bad 2620:fe::fe 2620:0:ccc::2 2620:0:ccd::2
#Domains=lan
#DoH# https://dns.alidns.com/dns-query https://dns.ipv6dns.com/dns-query https://101.6.6.6:8443/dns-query https://doh.360.cn https://doh.onedns.net/dns-query https://doh-pure.onedns.net/dns-query
DNSSEC=allow-downgrade
DNSOverTLS=opportunistic
MulticastDNS=yes
LLMNR=yes
EOF
unset -v resolv
unset -v lognamen
fi

echo -e "+++++++++++++RPM++++++++++++\n"

osrpm=`hostnamectl|grep -w "Operating System: Rocky"`
if [ -n "$osrpm" ];then
unset -v osrpm	
lognamen=`logname`
osversion=`awk 'NR==1{print $4}' /etc/redhat-release`
if [ ${osversion%.*} == "9" ];then
sed -e 's|^mirrorlist=|#mirrorlist=|g' \
    -e 's|^#baseurl=http://dl.rockylinux.org/$contentdir|baseurl=https://mirrors.aliyun.com/rockylinux|g' \
    -i.bak \
    /etc/yum.repos.d/rocky-extras.repo \
    /etc/yum.repos.d/rocky.repo
fi
yum install -y epel
yum install -y epel-release
yum install -y vim-X11.x86_64 ibus.x86_64

`updatedb`
	Tests "#c3dhcHBpbmVzcwo" /etc/sysctl.conf '$a\#c3dhcHBpbmVzcwo\nvm.swappiness=20'
Ddrc
yum remove firefox.x86_64 -y
yum install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-modify flathub --url=https://mirror.sjtu.edu.cn/flathub
fi
