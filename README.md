> ## $\color{#FF00FF}{ PARTITION }$
>> - biosboot ~ 1M-1024K...swapfile ~ 1-2G...efi ~ 50-100M.../...boot ~ 300-400M . home . usr . var . opt . tmp
>> - sudo blkid `/etc/default/grub /etc/fstab /boot/grub2/grub.cfg /boot/load/*`
>> - sed -i '$a\vm.swappiness=20' /etc/sysctl.conf#sysctl -p
---
> ## $\color{#FF0000}{ HTTP[S] }$
>> - is a professional lyrics search network [musicenc](https://www.musicenc.com/) 
>> .#Yandex offers internet search and other services like [yandex](https://yandex.com/)
>> .#Any bug fixes for a stable [kernel.org](https://www.kernel.org/)
>> .#the computational intelligence engine by [wolframalpha](https://www.wolframalpha.com/)
>> [@git-scm](https://git-scm.com/)
>> [@md5hashing](https://md5hashing.net/)
>> [@md5calc](https://md5calc.com/)
>> .# New Bootable USB Solution [ventoy](https://www.ventoy.net/en/index.html)
>> .# debian release,unofficial [cdimage-debian](https://cdimage.debian.org/images/)
>> .# a flexible, fast and multiplatform multimedia framework [gstreamer](https://gstreamer.freedesktop.org/)
>> .# ibus-libpinyin ibus-table-wubi [ibus-libpinyin](https://github.com/libpinyin/ibus-libpinyin)
>> .# lspci -v [realtek-network-interface-controllers](https://www.realtek.com/en/component/zoo/category/network-interface-controllers-10-100-1000m-gigabit-ethernet-pci-express-software)
>> [@B560M-PRO](https://us.msi.com/Motherboard/B560M-PRO/support)
>> [@magnet](https://yaurl302.top/DDWzy3oGkI?_=003)
>> [@feijisu](http://fjisu.top/) {antiX sparkylinux}
>> [@tempmail](https://tempmail.plus/en)
>> .# Google Chrome. Google's web browser. Virtual DJ. The most complete free software for DJs. uTorrent [apk](https://www.malavida.com/en)
---
>> - (Ubuntu) Server at breed.hackpascal.net Port 443 [breed-hackpascal](https://breed.hackpascal.net/)
>> .#takes security very seriously. We handle all security problems [debian-security](https://www.debian.org/security/)
>> .#So instead of downloading packages/software one by one from random sites [packages-debian](https://packages.debian.org/)
>> .#is a very powerful boot loader [gnu-grub](https://ftp.gnu.org/gnu/)
>> [@tracker-debian-kernel](https://tracker.debian.org/pkg/linux)
>> .#is being actively developed with frequent releases and has an ever growing list of features [virtualbox](https://download.virtualbox.org/virtualbox/)
>> .#an Advanced Penetration Testing Linux [kali-tools](https://www.kali.org/tools/)
>> .#is the largest collection of repositories and packages for Linux and Unix operating systems [packages-for-linux-and-unix](https://pkgs.org/)
>> .#To get a Chrome Extension source code [google-crx](https://crxdl.com/)
>> .#is an open-source enterprise operating system designed to be 100% bug-for-bug compatible with Red Hat Enterprise Linux® [rocky](https://download.rockylinux.org/pub/rocky/)
>> .#An Open Source, community owned and governed, forever-free enterprise [alma](https://almalinux.org/)
>> .#shares open source news and reviews of Linux and BSD based operating systems [distrowatch](https://distrowatch.com/)
>> .#is available free of charge and comes with the source code [freebsd](https://www.freebsd.org/)
>> [@c++Referenc](https://cppreference.com/)
>> .#The author and holder of the copyright of the software is Alexander L. Roshal [rarla](https://www.rarlab.com/)
---
>> - is developed by an independent community [flatpak](https://flatpak.org/setup)
>> .#is often called a "programmer's editor [vim](https://ftp.nluug.nl/pub/vim/unix/)
>> .#The GNU Image Manipulation Program [gimp](https://download.gimp.org/gimp/)
>> .#are the same as those on Mac and Linux - install man pages on your phone and read them in one session while experimenting with them in another [termux](https://f-droid.org/en/packages/com.termux/)
>> [@gnu-command](https://www.gnu.org/software/)
>> .#Try these free learning resources from the Perl community [METACPAN](https://metacpan.org/)
>> .#Continuously delivered distro that tracks just ahead of Red Hat Enterprise Linux (RHEL) development [centos-stream](https://mirror.stream.centos.org/)
---
> ##### $\color{#00e63e}{ SOURCES }$ `#debian{stable testing unstable}`
> - https://mirrors.huaweicloud.com
> - https://mirrors.tuna.tsinghua.edu.cn
> - https://mirrors.aliyun.com
> - https://mirrors.163.com
> - https://mirrors.ustc.edu.cn
> - http://mirrors.nju.edu.cn/
---
##### sudo flatpak remote-modify flathub --url=https://mirror.sjtu.edu.cn/flathub
##### sh <(curl -q https://platform.activestate.com/dl/cli/_pdli01/install.sh) -c'state activate --default ii00-org/Perl-5.36.0-Linux-CentOS' `aa123@qq.com aaa000000 https://platform.activestate.com/ii00`
##### ` https://dl.google.com/linux/direct/google-chrome-{stable unstable}_current_{amd64.deb x86_64.rpm} `

> ##### $\color{#00b330}{ APT }$
```
vim kaffeine qbittorrent audacious calc wcalc git gitk traceroute locate mtr \
fcitx fcitx-table-compose fcitx-googlepinyin fcitx-dbus-status fcitx-table-wubi \
wget bash-completion obs-studio gnome-shell-extension-dashtodock dnsutils aptitude \
nmap net-tools tcpdump audacity inkscape gimp krita audacity libreoffice \
libpam-tmpdir opendnssec rsync firmware-realtek
```

> ##### $\color{#00cc37}{ YUM[RPM][DNF] }$
```
epel-release.noarch epel-next-release.noarch gcc-c++ cmake bison ncurses ncurses-devel libaio \
gnome-shell-extension-dash-to-dock.noarch gnome-extensions-app.x86_64 gnome-tweaks.noarch ibus.x86_64 \
aide rear fapolicyd usbguard openscap openscap-scanner scap-security-guide \
fastfetch-bash-completion.noarch im-chooser.x86_64 xnview alsa xxhash
```

> ##### $\color{#0000FF}{ PKG }$
```
xorg gnome zh-auto-cn-l10n zh-ibus-libpinyin
  
echo -e "proc /proc\t\tprocfs rw 0 0" >> /etc/fstab
echo -e "dbus_enable=\"YES\"\nhald_enable=\"YES\"\ngdm_enable=\"YES\"\ngnome_enable=\"YES\"" >> rc.conf

XFCE ibus @.xinitrc
echo -e "XIM=ibus;export XIM\nGTK_IM_MODULE=ibus;export GTK_IM_MODULE\nQT_IM_MODULE=xim; export QT_IM_MODULE\nXMODIFIERS='@im=ibus'; export XMODIFIERS\nXIM_PROGRAM="ibus-daemon"; export XIM_PROGRAM\nXIM_ARGS="-daemonize -xim"; export XIM_ARGS" >> ~/.xinitrc
echo -e "setenv LANG zh_CN.UTF-8\nsetenv LC_CTYPE zh_CN.UTF-8\nsetenv XMODIFIERS @im=ibus" >> ~/.cshrc
#setenv LC_ALL zh_CN.UTF-8

echo "export LC_ALL=zh_CN.UTF-8" >> ~/.profile
 
#@@cap_mkdb
echo -e "chinese|Chinese Users Account:\\ \n\t:charset=UTF-8:\\ \n\t:lang=zh_CN.UTF-8:\\ \n\t:tc=default:" >> /etc/login.conf
 
#@@vipw :chinese:  #@@chpass

echo -e "me:\\ \n\t:charset=UTF-8:\\ \n\t:lang=zh_CN.UTF-8:" >> ~/.login_conf

@.Xresources
#@@xrdb -merge ~/.Xresources

xTerm*faceName: Bitstream Vera Serif Mono
xterm*faceSize: 12
xterm*vt100*geometry: 90x25
xterm*saveLines: 10000
xft*antiAlias:  true
xft*autoHint:  true
xterm*scrollBar: true
```

## $\color{#FF7D00}{ TOOLS }$

> ##### /usr/share/vim/vim82/colors/blue.vim
> - hi Normal	guifg=yellow	guibg=darkBlue	ctermfg=yellow	ctermbg=none

> ##### ~/.vimrc 
>> - /usr/share/vim/vimrc#debian
>> - /etc/vimrc#centos
```
syntax on
set hlsearch
set incsearch
set autoindent "redhat
set showmatch "redhat
set number "redhat
set mouse=a "redhat
set ai	"redhat
set autowrite "redhat
set t_Co=256 "redhat
colorscheme desert
"hi IncSearch	cterm=bold ctermfg=red ctermbg=darkgreen
"hi Search	cterm=bold ctermfg=red ctermbg=darkgreen
if &diff
  	colorscheme blue
endif
```

> ##### yum groupinstall 'Server with GUI' 
>> - systemctl set-default graphical.target 
>> - debian.tasksel
---
##### ` dpkg -l | grep ^rc | awk '{print $2}' | sudo xargs dpkg -P `

#### ` sed -i 's:*.psd1:&;*;*.*:g' /usr/share/gtksourceview-4/language-specs/powershell.lang `

> ~~sudo dpkg-reconfigure locales~~
>> - im-config
>> - /etc/locale.gen >> en_GB.UFT-8 UFT-8
---
> ##### sudo update-grub
>> - UEFI-based system:grub2-mkconfig -o /boot/efi/EFI/centos/grub.cfg
>> - Legacy system:/boot/grub2/grub.cfg
---
##### ` systemctl enable systemd-resolved.service ` #debian
##### ` systemctl disable accounts-daemon.service avahi-daemon.service ` #centos
> ##### /etc/gdm/custom.conf
>> + WaylandEnable=false DefaultSession=gnome-xorg.desktop #fedora
---
> ##### yum install libvirt-client
>> + virsh net-undefine default
>> + virsh net-destroy default
---
##### ` echo 'PS1="\[\e[0;32m\]\A \[\e[1;33m\]\u\[\e[0;35m\]@\[\e[0;32m\]\h \[\e[1;33m\]\W \[\e[1;31m\]? \[\e[0m\]"' >> ~/.bashrc `
``` 
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
#last redhat
function Euniq(){
	export $2="$(echo "$1" |tr : "\n"|sort|uniq|tr "\n" : |sed -n 's/:$//p')"
}
Euniq $PERL5LIB PERL5LIB
Euniq $PATH PATH
Euniq $PERL_LOCAL_LIB_ROOT PERL_LOCAL_LIB_ROOT
```

##### ` echo 'PS1="\[\e[1;32m\]\u\[\e[0;33m\]@\[\e[0;32m\]\h \[\e[1;33m\]\W \[\e[1;35m\]? \[\e[0m\]"' >> /root/.bashrc `
#### ` sed -i 's/GRUB_CMDLINE_LINUX=\"/GRUB_CMDLINE_LINUX=\"nouveau.modeset=1 /g ' /etc/default/grub @nouveau.modeset=0|1 #rd.driver.blacklist=nouveau `
##### ` yum remove $(rpm -qa | grep kernel | grep -v $(uname -r)) `
##### ` dracut -f /boot/initramfs-$(uname -r).img $(uname -r) ` #Create new initramfs image
##### ` systemctl --user mask tracker-extract.service tracker-miner-fs.service tracker-store.service tracker-writeback.service ` #debian

> #### $\color{#00ff85}{ CPAN }$
```
o conf auto_commit 1
o conf prerequisites_policy follow
o conf build_requires_install_policy yes
o conf commandnumber_in_prompt 0
o conf init /colorize/
install Term::ReadLine::Perl Term::ReadKey
install YAML
install YAML::XS
o conf yaml_module YAML::XS
install CPAN::SQLite
o conf use_sqlite yes
install CPAN
o conf init
```
---
> ## $\color{#FF6347}{ /etc/hosts }$
```
#127.0.0.1 localhost hostname
#127.0.1.1 hostname
#::1 localhost hostname ip6-localhost ip6-loopback
#ff02::1 ip6-allnodes
#ff02::2 ip6-allrouters
fe00::0 ip6-localnet
ff00::0 ip6-mcastprefix
ff02::3 ip6-allhosts
ff02::5 ip6-allospfrouters
ff02::9 ip6-allriprouters
ff02::A ip6-alleigrprouters
ff01::1 ip6-allnode-interface
ff01::2 ip6-allrouter-interface
ff02::4 ip6-dvmrp-router
ff02::6 ip6-ospf-igp-dr
ff02::7 ip6-strouter
ff02::8 ip6-sthost
ff02::B ip6-mobile-agent
ff02::D ip6-allpim-routers
ff02::E ip6-rsvp-encapsulation
#ff02::1:1 ip6-link-name
#ff02::1:2 ip6-alldhcp-agents
#ff05::2 ip6-allrouters-localscope-site
```
---
> ## $\color{#E9967A}{ /etc/NetworkManager/NetworkManager.conf }$
```
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
```
---
> ## $\color{#FF4500}{ /etc/systemd/resolved.conf }$
> + systemctl restart systemd-resolved.service && resolvectl
```
DNS= 2606:4700:4700::1001 2606:4700:4700::1111 2001:4860:4860::8888 2001:4860:4860::8844 2620:fe::9 2620:fe::fe:9 2a09:: 2a11:: 2620:119:53::53 2620:119:35::35 2001:dc7:1000::1 240c:f:1:22::6 2001:de4::101 2001:de4::102 2001:da8:8000:1:202:120:2:100 2001:da8:8000:1:202:120:2:101 2001:da8:ff:305:20c:29ff:fe1f:a92a 2a02:6b8::feed:ff 2a02:6b8:0:1::feed:ff 2a02:6b8::feed:bad 2a02:6b8:0:1::feed:bad 2620:fe::fe 2620:fe::9 2620:0:ccc::2 2620:0:ccd::2
FallbackDNS= 1.2.4.8 223.5.5.5 5.5.5.223 223.6.6.6 180.76.76.76 119.29.29.29 52.80.66.66 101.226.4.6 218.30.118.6 123.125.81.6 140.207.198.6 1.1.1.1 1.0.0.1 8.8.8.8 8.8.4.4 9.9.9.9 185.222.222.222 185.184.222.222 208.67.222.222 208.67.220.220 178.79.131.110 119.29.29.29
Domains=lan
DNSSEC=allow-downgrade
DNSOverTLS=opportunistic
MulticastDNS=yes
LLMNR=yes
```
---
