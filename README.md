> - /biosboot ~($\displaystyle\lim_{31k\rightarrow\infty}1M$).../boot=/efi ~($\displaystyle\sum_{i \to 33M}^{n \to system} {i \times n+100M}$).../ ~($\frac{\infty}{0.96}$).../swap ~($\sqrt[i \to 2]{RAM}$) . /home

##### blkid /etc/default/grub /etc/fstab /boot/grub2/grub.cfg /boot/load/* 0^2^16 140177258^9
---
##### [Wolframalpha](https://www.wolframalpha.com/) . [Swisscows](https://swisscows.com/en) . [Maintaining and evolving HTML](https://whatwg.org/) . [Mmdn web docs](https://developer.mozilla.org/zh-CN/docs/Web/) . [Msi](https://us.msi.com/Motherboard/B560M-PRO/support) . [Comics](http://fjisu.top/)
---
##### [Ventoy](https://www.ventoy.net/en/index.html) . [Tempmail](https://tempmail.plus/en) . [.apk](https://www.malavida.com/en) . [Tracker.deb](https://tracker.debian.org/pkg/linux) . [Cppreference](https://cppreference.com/)
---
##### [Gnu-command](https://www.gnu.org/software/) . [ ? ](https://quickref.cn/) . [Gentoo](https://wiki.gentoo.org/) . [Funtoo](https://www.funtoo.org/) . [Nftables](https://wiki.nftables.org/)
---
> #### [SOURCES](https://cdimage.debian.org/images/) $\oint_{testing_{unstable}}^{stable} {debian}$
> - https://mirrors.tuna.tsinghua.edu.cn
> - https://mirrors.aliyun.com # [ freebsd 13,14 ]
> - https://mirrors.ustc.edu.cn # [ freebsd 13,14 ]
> - http://mirrors.nju.edu.cn/ # [ freebsd 13,14 ]
---
##### dig @ns1.google.com TXT o-o.myaddr.l.google.com | whoami.akamai.net. @ns1-1.akamaitech.net | myip.opendns.com @resolver1.opendns.com
##### nslookup -type=TXT o-o.myaddr.l.google.com ns1.google.com | whoami.akamai.net. ns1-1.akamaitech.net | myip.opendns.com resolver1.opendns.com
##### timedatectl set-timezone Asia/Chongqing # /etc/systemd/timesyncd.conf ? /etc/chrony.conf ? /etc/ntpsec/ntp.conf # server ntp.org.cn iburst ? server edu.ntp.org.cn iburst
##### sudo flatpak remote-modify flathub --url=https://mirror.sjtu.edu.cn/flathub
##### [On Flatpak error fonts](https://flatpak.org/setup/) ? cp -r /etc/fonts/* org.example.com/config/fontconfig
##### `https://dl.google.com/linux/direct/google-chrome-stable[beta][unstable]_current_amd64.deb[x86_64.rpm]`
---
##### gdm ? [I3wm](https://i3wm.org/) ? [Sway](https://swaywm.org/) ? [Awesomewm](https://awesomewm.org/) ? [Dwm](#)
---
> ##### $APT_{dpkg}^{apt-get} \Downarrow$ [Debian](https://www.debian.org/security/) ? [Kali](https://www.kali.org/tools/)
```
lz4 ntp vim-gtk3 kaffeine audacious git traceroute locate smartmontools ntpdate fcitx fcitx-googlepinyin fcitx-config-gtk fcitx-table-wubi dnsutils wget bash-completion obs-studio aptitude links xterm net-tools wpasupplicant nmap tcpdump audacity inkscape gimp krita audacity libreoffice make gcc isc-dhcp-client rsync dnsmasq resolvconf hexcompare aircrack-ng firmware-realtek xxd xxhash qbittorrent aria2

xset s 0 0 ; xset dpms 0 0 9999 ; xset q

? connection wifi
iwconfig
ifconfig eth0 up
iwlist eth0 scan | grep "ESSID"
wpa_passphrase name password > wpa_supplicant.conf
wpa_supplicant -B -c wpa_supplicant.conf -i eth0
dhclient eth0

? dnsmasq.conf
log-queries
log-dhcp
interface=wlan0
dhcp-range=10.0.0.100,10.0.0.200,12h
dhcp-option=6,192.168.0.1,1.1.1.1
dhcp-option=3,192.168.0.1
bind-interfaces
except-interface=lo

? set ap
# /etc/dhcp/dhcpd.conf
default-lease-time 600;
max-lease-time 7200;
subnet 10.0.0.0 netmask 255.255.255.0 {
  range 10.0.0.100 10.0.0.200;
  option broadcast-address 10.0.0.255;
  option domain-name-servers 114.114.114.114, 1.2.4.8;
  option routers 10.0.0.1;
}
ip addr add 10.0.0.11/24 dev wlan0
ip link set wlan0 up
hostapd hostapd.conf
dhcpd
sysctl net.ipv4.ip_forward=1
nft add rule ip filter forward iifname "eth0" oifname "wlan0" ip saddr 192.168.1.0/24 ct state new accept
nft add rule ip filter forward ct state established,related accept
nft add rule ip nat postrouting oifname "eth0" masquerade
# clent.gateway set eth0.ip
# nft add rule ip nat prerouting iifname "at0" tcp dport 80 ip daddr 192.168.1.100 dnat to 192.168.0.2:443

?o /etc/network/interfaces # man interfaces
#auto eth0
#iface eth0 inet static/dhcp
#address 192.168.1.100
#network 192.168.1.0
#netmask 255.255.255.0
#gateway 192.168.1.1
#broadcast 192.168.1.255
systemctl disable networking
systemctl enable systemd-networkd

? ip route add default via 192.168.0.1 dev br0
ip link set dev br0 type stp on
ip link set dev br0 nomaster

make localmodconfig ; make menuconfig ; make bzImage -j4 ; make modules -j4 && make modules_install ; make install # apt install linux-source
sudo dpkg-reconfigure linux-image-$(uname -r)
sudo update-initramfs -u -k all
netstat -tuln|awk '{print $4}'|awk -F: '{print $2}'|grep -v '^$'|sort|uniq|xargs -I {} sudo lsof -i :{}

```
##### putty/SecureCRT tftpd # insmod ch34x,modprobe usbserial # CONFIG_USB_SERIAL CONFIG_USB_SERIAL_GENERIC # flashrom -p ch341a_spi [-E|-r <file>|-w <file>|-v <file>]

> ##### $YUM_{RPM}^{DNF} \Downarrow$ [RockyLinux](https://rockylinux.org/) ? [AlmaLinux](https://almalinux.org/)
```
epel-release.noarch epel-next-release.noarch ibus.x86_64 xorg-x11-server-Xorg.x86_64 \
xorg-x11-xinit.x86_64 xorg-x11-xinit-session.x86_64
google-droid-sans-fonts.noarch google-noto-sans-cjk-ttc-fonts.noarch bind-utils
```
> ##### $PKG_{apt}^{dpkg} \Downarrow$ [FreeBSD](https://www.freebsd.org/)
```
mkdir -p /usr/local/etc/pkg/repos && vi FreeBSD.conf
    # quarterly [ latest ]
FreeBSD: {
  url: "https://mirrors.ustc.edu.cn/freebsd-pkg/${ABI}/quarterly",
}

## /etc/resolv.conf
nameserver 1.0.0.1
## /etc/dhclient.conf
interface "re0" {
    prepend domain-name-servers 64.6.64.6,8.8.4.4;
}
## service netif restart 
## dhclient re0

## /boot/loader.conf
if_re_load="YES"
if_re_name="/boot/modules/if_re.ko"

# pkg install xorg-server xorg-drivers xinit xauth i3 xterm sudo isc-dhcp ? gnome-lite

# /usr/local/etc/sudoers

### zh-auto-cn-l10n fusefs-ext2 fusefs-exfat

## /etc/fstab
proc /proc	 procfs rw 0 0

## /etc/rc.conf
ifconfig_re0="inet 10.0.2.100 netmask 255.255.255.0"
defaultrouter="10.0.2.2"
hostname="re"
ifconfig_re0="DHCP"
linux_enable="YES"
dbus_enable="YES"
hald_enable="YES"
gdm_enable="YES"
gnome_enable="YES"

# echo "exec dbus-launch --exit-with-session i3" >> ~/.xinitrc

## /boot/loader.conf
if_re_load="YES"
if_re_name="/boot/modules/if_re.ko"
nvidia_load="YES"
kld_list="/boot/modules/nvidia.ko /boot/modules/nvidia-modeset.ko"

### kldstat
### Xorg :1 -configure

### zh-fcitx-libpinyin zh-fcitx-configtool
## ~/.xprofile ~/.xinitrc
export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
```
#### /etc/X11/xorg.conf
```
Section "Monitor"
    Identifier "Monitor0"
    VendorName "Monitor Vendor"
    ModelName "Monitor Model"
    HorizSync 30-107
    VertRefresh 48-120
    Option "DPMS"
EndSection   
Section "Screen"
    Identifier "Screen0"
    Device "Card0"
    Monitor "Monitor0"
    DefaultDepth 24
    SubSection "Display"
        Viewport 0 0
        Depth 24
        Modes "1024x768"
    EndSubSection
EndSection
```
##### appres XTerm | grep -i utf8

#### ~/.Xresources
```
XTerm*faceName: Monospace:style=Book:size=11:antialias=true
XTerm*faceNameDoublesize: size=11
XTerm*locale: true
XTerm*utf8Title: true
XTerm*utf8: 1
xft.dpi: 96
xpdf.title: PDF
xft.antialias: true
xft.rgba: rgb
xft.hinting: true
xft.hintstyle: hintslight
XTerm*cursorColor: #ffa530

XTerm*selectToClipboard: true
!*VT100*translations: #override \n\
!Ctrl <KeyPress> Insert : insert-selection(CLIPBOARD, CUT_BUFFER1) \n\
!Shift Ctrl<Btn2Up> : insert-selection(PRIMARY, CUT_BUFFER0) \n\
!Ctrl <BtnUp> : select-end(CLIPBOARD, CUT_BUFFER1) \n\
!Ctrl <BtnUp> : select-end(PRIMARY, CUT_BUFFER0)

XTerm*renderFont: true
XTerm*cjk_width: true
XTerm*dynamicColors: true
XTerm*eightBitInput: true
XTerm*decTerminalID: vt340
XTerm*rightScrollBar: false
XTerm*jumpScroll: true
XTerm*multiScroll: true
XTerm*toolBar: false
XTerm*Scrollbar*thickness: 10
XTerm*Scrollbar*background: black
XTerm*Scrollbar*foreground: gray90
XTerm*ScrollKey: true
XTerm*ScrollTtyOutput: false
XTerm*ScrollBar: false

XTerm*vt100*geometry: 80x30
XTerm.vt100*fadeColor: #002b36
XTerm.vt100*pointerColorBackground: #586e75
XTerm.vt100*pointerColorForeground: #93a1a1
XTerm*allowBoldFonts: true
XTerm*boldMode: true
XTerm*loginShell: false
XTerm*saveLines: 2000
!XTerm*charClass: 33:48,35:48,37:48,43:48,45-47:48,64:48,95:48,126:48
XTerm*colorBDMode: true
XTerm*colorBD: #FF69B4

XTerm*background: #1a1a1a
XTerm*foreground: #d3d3d3
! 0,bg 1,rws 2,ver 3,compressed-archive-exec 4,d777 5,n
! 6,n 7,n 8,non-highlighted-parts 9,error-msg 10,prompt
! 11,$ 12,d-x 13,.png .xpm .svg 14,l
! 15,highlighted-parts
XTerm*color0: #000000
XTerm*color1: #6A5ACD
XTerm*color2: #f5f5f5
XTerm*color3: #a85400
XTerm*color4: #1E90FF
XTerm*color5: #a800a8
XTerm*color6: #00a8a8
XTerm*color7: #ffeeaa
XTerm*color8: #4682b4
XTerm*color9: #fc5454
XTerm*color10: #54fc54
XTerm*color11: #fcfc54
XTerm*color12: #32cd32
XTerm*color13: #fc54fc
XTerm*color14: #54fcfc
XTerm*color15: #000000
```
## [Vim](https://ftp.nluug.nl/pub/vim/unix/)
```
set viminfofile=NONE
syntax on
set cursorcolumn
"set cursorline
set laststatus=2
set statusline=\ %<\ %n,%B%M%R%h%w%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l\ %)
set hlsearch
set incsearch
set autoindent "redhat
set showmatch "redhat
"set number "redhat
"set mouse=a "redhat
"set ai	"redhat
"set autowrite "redhat
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
```
## ~~[Arch](https://archlinux.org/)~~
```
# iwctl
device list
station wlan-name scan
station wlan-name get-networks
station wlan-name connect wifi-name

/etc/pacman.d/mirrorlist # Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch
# /etc/pacman.conf

pacstrap /mnt base linux-lts linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab

arch-chroot /mnt
pacman -S grub efibootmgr os-prober vim sudo dhcp wqy-microhei xorg-server xorg-xinit \
xf86-video-vesa i3-wm dmenu xterm fcitx fcitx-configtool fcitx-googlepinyin

# ~/.config/i3/config
exec_always --no-startup-id "fcitx -dr" 
# exec_always --no-startup-id "ibus-daemon -drx"
exec "xrdb -load ~/.Xresources"
exec --no-startup-id "xset s 0 0"
exec --no-startup-id "xset dpms 0 0 9999"
xterm -u8 # fc-list :lang=zh

pacman -Si|-Qi package ?? rpm -qi
pacman -Syu ?? apt upgrade
pacman -Rsn package ?? apt remove --purge
pacman -Q ?? dpkg -l
pacman -U package ?? dpkg --install
pacman -Qdtq | pacman -Rsn -
? mkinitcpio -p linux
```
## ~~[Gentoo](https://www.gentoo.org/)~~
```
mount | grep efi
? gdisk cgdisk | fdisk cfdisk /dev/sda # m p g o n t d l w
mkfs.vfat -F 32 /dev/sda1
mkfs.ext4 /dev/sda3
mkswap /dev/sda2
swapon /dev/sda2
mount /dev/sda3 /mnt/gentoo

tar xpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner

mirrorselect -i -o >> /mnt/gentoo/etc/portage/make.conf
cp -r /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf
cp --dereference /etc/resolv.conf /mnt/gentoo/etc/

mount --types proc /proc /mnt/gentoo/proc
mount --bind /sys /mnt/gentoo/sys
mount --bind /dev /mnt/gentoo/dev
mount --bind /run /mnt/gentoo/run
? mount --types tmpfs --options nosuid,nodev,noexec shm /dev/shm
? chmod 1777 /dev/shm /run/shm

chroot /mnt/gentoo /bin/bash
emerge-webrsync # /var/db/repos/gentoo/
env-update && source /etc/profile && export PS1="(chroot) ${PS1}"

mount /dev/sda1 /efi

# /etc/portage/make.conf
MAKEOPTS="-j6"
GRUB_PLATFORMS="efi-64"

ln -sf /usr/share/zoneinfo/Europe/Brussels /etc/localtime
? /etc/locale.gen en_US.UTF-8 UTF-8 # locale-gen && env-update && source /etc/profile
? /etc/locale.conf LANG=en_US.UTF8

emerge --ask sys-kernel/linux-firmware sys-apps/pciutils

emerge --ask sys-kernel/gentoo-sources
eselect kernel set 1
make localmodconfig # menuconfig clean mrproper oldconfig
? nouveau efi selinux iptable nf_tables IPVS conntrack exfat tun/tap
make -j6 && make modules_install
make install
emerge -a sys-kernel/dracut
dracut --kver kernel.version

# blkid mount
UUID=? /efi vfat defaults 0 2
UUID=? none swap sw 0 0
UUID=? / ext4 rw,noatime 0 1

mount -o remount,rw -t efivarfs efivarfs /sys/firmware/efi/efivars/
emerge --ask sys-boot/grub sys-boot/efibootmgr

sys-kernel/installkernel -systemd
sys-apps/systemd boot secureboot # bootctl install && bootctl list
sys-boot/shim secureboot
    # /etc/portage/make.conf # openssl req -new -nodes -utf8 -sha256 -x509 -outform PEM -out /efi/mok.pem -keyout /efi/mok.pem
        SECUREBOOT_SIGN_KEY="/efi/mok.pem"
        SECUREBOOT_SIGN_CERT="/efi/mok.pem"
# /efi/loader/entries/gentoo.conf
title gentoo
linux /vmlinuz # /efi/
initrd /initramfs.img # /efi/
options root=/dev/xxx

# /efi/loader/loader.conf
default gentoo.conf
# bootctl update

emerge -a app-portage/gentoolkit media-sound/alsa-utils sys-apps/dbus net-misc/dhcp x11-apps/xset
systemctl enable systemd-networkd
? https://www.freedesktop.org/software/systemd/man/latest/systemd.network.html
# /etc/systemd/network/eth0.network
[Match]
Name=eth0

[Network]
DHCP=yes
# Address=192.168.0.100/24
# Gateway=192.168.0.1
DNSSEC=allow-downgrade
DNSOverTLS=opportunistic
MulticastDNS=yes
LLMNR=no

# /etc/default/grub
GRUB_DISABLE_OS_PROBER=false
GRUB_DEFAULT=saved
GRUB_SAVEDEFAULT=true
GRUB_GFXMODE=1024x768
GRUB_TERMINAL="console"

grub-install --target x86_64-efi --efi-directory /boot/efi --recheck [<--removable>]
? grub-install --target i386-pc --boot-directory /boot --recheck
grub-mkconfig -o /boot/grub/grub.cfg

? grub-mkstandalone --compress gz -o /efi/EFI/gentoo/xxx.efi -d /usr/lib/grub/x86_64-efi/ -O x86_64-efi /boot/grub/grub.cfg -v
? efibootmgr -c -d /dev/sda -p 2 -L "Gentoo" -l "\EFI\gentoo\xxx.efi"
? efibootmgr -b 0002 -B

useradd -m -G users,wheel,audio,video username
passwd username

umount -l /mnt/gentoo/dev{/shm,/pts,}
? mount -o remount,rw /
? emerge -avuDN @world
? net-firewall/iptables net-firewall/nftables sys-process/lsof net-wireless/wpa_supplicant sys-fs/exfat-utils sys-fs/dosfstools dev-util/intel-ocl-sdk app-crypt/hashcat app-crypt/johntheripper media-gfx/flameshot

# /etc/portage/package.use/zz-autounmask
net-libs/axtls cgi-php doc httpd savedconfig
dev-lang/php cgi apache2 fpm
www-servers/lighttpd php
app-misc/mime-types nginx
x11-terms/xterm sixel xinerama 
sys-devel/gcc objc objc++ objc-gc go
app-editors/vim lua perl python racket ruby tcl
dev-libs/openssl fips rfc3779
net-firewall/iptables nftables
net-firewall/nftables static-libs

? touch /etc/portage/package.accept_keywords/zzz_autounmask
? emerge mypackage --autounmask-write --autounmask
? etc-update || dispatch-conf

? /usr/src/linux-6.6.13-gentoo/System.map -> System.map-6.6.13-gentoo-x86_64
? dracut --kver xxx -> initramfs-6.6.13-gentoo-x86_64.img
? .config -> config-6.6.13-gentoo-x86_64
? /usr/src/linux-6.6.13-gentoo/arch/x86_64/boot/bzImage -> vmlinuz-6.6.13-gentoo-x86_64

# systemd-boot :Secure Boot
emerge --ask sys-boot/shim sys-boot/mokutil app-crypt/sbsigntools
## sbsign /efi/EFI/gentoo/grubx64.efi --key mok.pem --cert mok.pem --out /efi/EFI/gentoo/grubx64.efi
## cp /usr/share/shim/BOOTX64.EFI /efi/EFI/gentoo/shimx64.efi
## cp /usr/share/shim/mmx64.efi /efi/EFI/gentoo/mmx64.efi
cp /usr/share/shim/mmx64.efi /efi/EFI/BOOT/mmx64.efi
cp /efi/EFI/systemd/systemd-bootx64.efi /efi/EFI/BOOT/grubx64.efi
openssl req -new -nodes -utf8 -sha256 -x509 -outform PEM -out mok.pem -keyout mok.pem
openssl x509 -in mok.pem -inform PEM -out mok.der -outform DER
mokutil --import mok.der
```
##### [Openwrt](https://lxr.openwrt.org/)
```
xsltproc ecj fastjar java-propose-classpath libelf-dev libncursesw5-dev python3-setuptools \
python3-dev subversion swig xsltproc zlib1g-dev build-essential clang flex g++ gawk gcc-multilib \
gettext libncurses5-dev libssl-dev python3-distutils asciidoc binutils patch bison autoconf texinfo \
sharutils subversion ncurses-term zlib1g-dev libc6-dev-i386 uglifyjs msmtp libglib2.0-dev xmlto \
qemu-utils libtool

git clone https://github.com/openwrt/openwrt
git checkout v23.05.4

./feeds.conf.default
## src-git packages https://git.openwrt.org/feed/packages.git
# src-git luci https://git.openwrt.org/project/luci.git
# src-git routing https://git.openwrt.org/feed/routing.git
# src-git telephony https://git.openwrt.org/feed/telephony.git

# ./scripts/feeds update -a [luci]
# ./scripts/feeds install -a [-p luci]

# ./target/linux/ramips/dts # reg = <0x50000 0x1fb0000> # 32m
# ./target/linux/ramips/image # IMAGE_SIZE := 32m
# links https://downloads.openwrt.org/releases/23.05.3/xx/config.buildinfo
make defconfig && make menuconfig # disable uhttpd,luci
make -j4 V=s
```
##### yum groupinstall 'Server with GUI' # systemctl set-default graphical.target 
##### ` dpkg -l | grep ^rc | awk '{print $2}' | sudo xargs dpkg -P `
##### ` yum remove $(rpm -qa | grep kernel | grep -v $(uname -r)) `
``` 
PS1='\[\e[0;32m\]\A \[\e[1;95m\]\W \[\e[1;33m\]\$ \[\e[0m\]'

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
cat ~/.bash_history > ~/.bash_history
```
