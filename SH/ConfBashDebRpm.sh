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
Teste "#UFMxCg" $bashrcpathu 'PS1="\[\e[0;32m\]\A \[\e[1;33m\]\u\[\e[0;35m\]@\[\e[0;32m\]\h \[\e[1;33m\]\W \[\e[1;31m\]? \[\e[0m\]"'
Teste "#UFMxCg" $bashrcpath 'PS1="\[\e[1;32m\]\u\[\e[0;33m\]@\[\e[0;32m\]\h \[\e[1;33m\]\W \[\e[1;35m\]? \[\e[0m\]"'
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
EOF
fi
unset -v expsgr
unset -v bashrcpath
unset -v bashrcpathu
if [ -z "$vimrcpathf" ];then
cat >> $vimrcpath << "EOF"
"aWYmZGlmZgo
syntax on
set hlsearch
set incsearch
set autoindent "redhat
set showmatch "redhat
set number "redhat
set mouse=a "redhat
set autowrite "redhat
set t_Co=256 "redhat
colorscheme desert
if &diff
	colorscheme blue
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
deb https://repo.huaweicloud.com/debian/ bullseye main contrib non-free
deb https://repo.huaweicloud.com/debian/ bullseye-updates main contrib non-free
deb https://repo.huaweicloud.com/debian/ bullseye-backports main contrib non-free
deb https://repo.huaweicloud.com/debian-security bullseye-security main contrib non-free
EOF
	echo "Acquire::http::Pipeline-Depth \"0\";" > /etc/apt/apt.conf.d/99nopipelining
apt update -y
	apt autopurge fcitx* uim* xiterm+thai firefox-esr -y
	apt install vim vim-gtk kaffeine qbittorrent audacious calc wcalc git gitk traceroute locate mtr \
fcitx fcitx-table-compose fcitx-googlepinyin fcitx-dbus-status fcitx-table-wubi \
wget bash-completion obs-studio gnome-shell-extension-dashtodock dnsutils \
nmap net-tools tcpdump audacity inkscape gimp krita audacity libreoffice \
libpam-tmpdir opendnssec -y
	`updatedb`
	Tests "#c3dhcHBpbmVzcwo" /etc/sysctl.conf '$a\#c3dhcHBpbmVzcwo\nvm.swappiness=20'
Ddrc
geditlang=`locate "language-specs/powershell.lang"|sort -r`
Tests "\*\.psd1;\*;\*\.\*" $geditlang 's:*.psd1:&;*;*.*:g'
unset -v geditlang
systemctl enable systemd-resolved.service
defaultgr=`grep -w "#bm91dmVhdQo" /etc/default/grub`
if [ -z "$defaultgr" ];then
	echo "#bm91dmVhdQo" >> /etc/default/grub
sed -i 's/GRUB_CMDLINE_LINUX=\"/GRUB_CMDLINE_LINUX=\"nouveau.modeset=1 /g ' /etc/default/grub
fi
unset -v defaultgr
Batfun /etc/hosts
hostn="ht"
echo "$hostn" > /etc/hostname
echo -e "127.0.0.1 localhost $hostn\n127.0.1.1 $hostn\n::1 localhost $hostn ip6-localhost ip6-loopback" > /etc/hosts
unset hostn
netmanager="/etc/NetworkManager/NetworkManager.conf"
Batfun ${netmanager}
cat > $netmanager << "EOF"
[main]
plugins=ifupdown,keyfile
dns=dnsmasq
systemd-resolved=true
rc-manager=resolvconf

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
DNS= 2606:4700:4700::1001 2606:4700:4700::1111 2001:4860:4860::8888 2001:4860:4860::8844 2620:fe::9 2620:fe::fe:9 2a09:: 2a11:: 2620:119:53::53 2620:119:35::35 2001:dc7:1000::1 240c:f:1:22::6 2001:de4::101 2001:de4::102 2001:da8:8000:1:202:120:2:100 2001:da8:8000:1:202:120:2:101 2001:da8:ff:305:20c:29ff:fe1f:a92a 2a02:6b8::feed:ff 2a02:6b8:0:1::feed:ff 2a02:6b8::feed:bad 2a02:6b8:0:1::feed:bad 2620:fe::fe 2620:fe::9 2620:0:ccc::2 2620:0:ccd::2
FallbackDNS= 1.2.4.8 223.5.5.5 5.5.5.223 223.6.6.6 180.76.76.76 119.29.29.29 52.80.66.66 101.226.4.6 218.30.118.6 123.125.81.6 140.207.198.6 1.1.1.1 1.0.0.1 8.8.8.8 8.8.4.4 9.9.9.9 185.222.222.222 185.184.222.222 208.67.222.222 208.67.220.220 178.79.131.110 119.29.29.29
Domains=lan
DNSSEC=allow-downgrade
DNSOverTLS=opportunistic
MulticastDNS=yes
LLMNR=yes
EOF
unset -v resolv
unset -v lognamen
apt install flatpak -y
apt install gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-modify flathub --url=https://mirror.sjtu.edu.cn/flathub
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
yum install epel-release -y
yum install vim-X11.x86_64 ibus.x86_64 gcc-c++ cmake bison ncurses ncurses-devel libaio \
	aide rear fapolicyd usbguard openscap openscap-scanner scap-security-guide \
	fastfetch-bash-completion.noarch im-chooser.x86_64 -y

`updatedb`
	Tests "#c3dhcHBpbmVzcwo" /etc/sysctl.conf '$a\#c3dhcHBpbmVzcwo\nvm.swappiness=20'
Ddrc
geditlang=`locate "language-specs/powershell.lang"|sort -r`
Tests "\*\.psd1;\*;\*\.\*" $geditlang 's:*.psd1:&;*;*.*:g'
unset -v geditlang
defaultgr=`grep -w "#bm91dmVhdQo" /etc/default/grub`
if [ -z "$defaultgr" ];then
	echo "#bm91dmVhdQo" >> /etc/default/grub
sed -i 's/GRUB_CMDLINE_LINUX=\"/GRUB_CMDLINE_LINUX=\"nouveau.modeset=1 /g ' /etc/default/grub
fi
unset -v defaultgr
Batfun /etc/hosts
hostn="ht"
echo "$hostn" > /etc/hostname
echo -e "127.0.0.1 localhost $hostn\n127.0.1.1 $hostn\n::1 localhost $hostn" > /etc/hosts
unset hostn
defaultgr=`grep -w "#bm91dmVhdQo" /etc/default/grub`
if [ -z "$defaultgr" ];then
	echo "#bm91dmVhdQo" >> /etc/default/grub
sed -i 's/GRUB_CMDLINE_LINUX=\"/GRUB_CMDLINE_LINUX=\"nouveau.modeset=1 /g ' /etc/default/grub
fi
unset -v defaultgr
yum remove firefox.x86_64 -y
yum install flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak remote-modify flathub --url=https://mirror.sjtu.edu.cn/flathub
fi
