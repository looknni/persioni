##### blkid /etc/default/grub /etc/fstab /boot/grub2/grub.cfg /boot/load/* 0^2^16 140177258^9
---
##### [Wolframalpha](https://www.wolframalpha.com/) . [Swisscows](https://swisscows.com/en) . [Maintaining and evolving HTML](https://whatwg.org/) . [Mmdn web docs](https://developer.mozilla.org/zh-CN/docs/Web/) . [Msi](https://us.msi.com/Motherboard/B560M-PRO/support) . [Comics](http://fjisu.top/)
---
##### [Ventoy](https://www.ventoy.net/en/index.html) . [.apk](https://www.malavida.com/en) . [Tracker.deb](https://tracker.debian.org/pkg/linux) . [Cppreference](https://cppreference.com/)
---
##### [Gnu-command](https://www.gnu.org/software/) . [ ? ](https://quickref.cn/) . [Nftables](https://wiki.nftables.org/)
---
> - https://mirrors.tuna.tsinghua.edu.cn
> - https://mirrors.aliyun.com # freebsd 13,14
> - https://mirrors.ustc.edu.cn # freebsd 13,14
> - http://mirrors.nju.edu.cn # freebsd 13,14
---
##### dig @ns1.google.com TXT o-o.myaddr.l.google.com
##### timedatectl set-timezone Asia/Chongqing # /etc/systemd/timesyncd.conf ? /etc/chrony.conf ? /etc/ntpsec/ntp.conf # server ntp.org.cn iburst ? server edu.ntp.org.cn iburst
##### sudo flatpak remote-modify flathub --url=https://mirror.sjtu.edu.cn/flathub
##### [On Flatpak error fonts](https://flatpak.org/setup/) ? cp -r /etc/fonts/* org.example.com/config/fontconfig
##### `https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb` # beta|unstable x86_64.rpm
---
##### gdm ? [I3wm](https://i3wm.org/) ? [Sway](https://swaywm.org/) ? [Awesomewm](https://awesomewm.org/) ? [Dwm](#)
---
> ## ~~[Debian](https://www.debian.org/security/)~~
```
deb https://mirrors.ustc.edu.cn/debian/ bookworm main non-free non-free-firmware
deb-src https://mirrors.ustc.edu.cn/debian/ bookworm main non-free non-free-firmware
deb https://mirrors.aliyun.com/debian-security/ bookworm-security main non-free non-free-firmware
deb-src https://mirrors.aliyun.com/debian-security/ bookworm-security main non-free non-free-firmware
deb https://mirrors.ustc.edu.cn/debian/ bookworm-updates main non-free non-free-firmware
deb-src https://mirrors.ustc.edu.cn/debian/ bookworm-updates main non-free non-free-firmware

gpm ntp vim vlc git traceroute smartmontools fcitx fcitx-googlepinyin \
fcitx-config-gtk fcitx-table-wubi dnsutils wget links xterm net-tools \
wpasupplicant nmap tcpdump inkscape gimp krita audacity libreoffice make gcc isc-dhcp-client \
dnsmasq resolvconf hexcompare aircrack-ng xxd xxhash qbittorrent aria2

dpkg-reconfigure console-setup # VGA

? connection wifi
iwconfig
ifconfig eth0 up
iwlist eth0 scan | grep "ESSID"
wpa_passphrase name password > wpa_supplicant.conf
wpa_supplicant -B -c wpa_supplicant.conf -i eth0
dhclient eth0

? dnsmasq.conf
cache-size=150
server=114.114.114.114
interface=wlan0
dhcp-range=10.0.0.100,10.0.0.200,12h
dhcp-option=3,192.168.0.1
dhcp-option=6,192.168.0.1,8.8.4.4
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
# client.gateway set eth0.ip
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

make localmodconfig ; make menuconfig ; make bzImage -j4 ; make modules_install && make install # apt install linux-source
dpkg-reconfigure linux-image-$(uname -r)
update-initramfs -u -k all
netstat -tuln|awk '{print $4}'|awk -F: '{print $2}'|grep -v '^$'|sort|uniq|xargs -I {} sudo lsof -i :{}
```
##### putty/SecureCRT tftpd # insmod ch34x,modprobe usbserial # CONFIG_USB_SERIAL CONFIG_USB_SERIAL_GENERIC # flashrom -p ch341a_spi [-E|-r <file>|-w <file>|-v <file>]

> ## ~~[RockyLinux](https://rockylinux.org/)~~ ? [AlmaLinux](https://almalinux.org/)
```
epel-release.noarch epel-next-release.noarch ibus.x86_64 xorg-x11-server-Xorg.x86_64 \
xorg-x11-xinit.x86_64 xorg-x11-xinit-session.x86_64
google-droid-sans-fonts.noarch google-noto-sans-cjk-ttc-fonts.noarch bind-utils
```
> ## ~~[FreeBSD](https://www.freebsd.org/)~~
```
sysctl net.wlan.devices # sysctl -a | grep net.wlan
ifconfig wlan0 create wlandev xxx ; ifconfig wlan0 ssid wifiname
service netif restart ; ifconfig wlan0 up ; dhclient wlan0

mkdir -p /usr/local/etc/pkg/repos && vi FreeBSD.conf
	# quarterly [ latest ]
FreeBSD: {
    url: "https://mirrors.ustc.edu.cn/freebsd-pkg/${ABI}/quarterly",
}

## /etc/resolv.conf
nameserver 8.8.8.8
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

## /boot/loader.conf
if_re_load="YES"
if_re_name="/boot/modules/if_re.ko"
nvidia_load="YES"
kld_list="/boot/modules/nvidia.ko /boot/modules/nvidia-modeset.ko"

### kldstat
### Xorg :1 -configure

### zh-fcitx-libpinyin zh-fcitx-configtool
## ~/.xprofile ~/.xinitrc
export GTK_IM_MODULE=xim
export QT_IM_MODULE=xim
export XMODIFIERS=@im=fcitx
exec i3
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
bindsym $mod+Return exec "xterm -u8" # fc-list :lang=zh

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
? fdisk /dev/sda # m p g o n t d l w # lsblk -f
mkfs.vfat -F 32 /dev/sda1 # /efi
mkfs.ext4 /dev/sda3 # / /boot
mkswap /dev/sda2 ; swapon /dev/sda2

mount /dev/sda3 /mnt/gentoo
cd /mn/gentoo ; tar xpvf stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner

mirrorselect -i -o >> etc/portage/make.conf
cp -r usr/share/portage/config/repos.conf etc/portage/repos.conf/gentoo.conf
cp -L /etc/resolv.conf etc/

mount --types proc /proc /mnt/gentoo/proc
mount --bind /sys /mnt/gentoo/sys
mount --bind /dev /mnt/gentoo/dev
mount --bind /run /mnt/gentoo/run

chroot /mnt/gentoo /bin/bash
emerge-webrsync # /var/db/repos/gentoo/
emerge -av app-editors/vim app-shells/bash-completion
env-update && source /etc/profile && export PS1="(chroot) ${PS1}"
mount /dev/sda1 /efi

# /etc/sysctl.conf 
vm.min_free_kbytes=100000

# /etc/portage/make.conf # openssl req -new -nodes -utf8 -sha256 -x509 -outform PEM -out /efi/mok.pem -keyout /efi/mok.pem
MAKEOPTS="-j6"
GRUB_PLATFORMS="efi-64"
# SECUREBOOT_SIGN_KEY="/efi/mok.pem"
# SECUREBOOT_SIGN_CERT="/efi/mok.pem"

ln -sf /usr/share/zoneinfo/Europe/Brussels /etc/localtime
# /etc/locale.gen en_US.UTF-8 UTF-8 # locale-gen && env-update && source /etc/profile
# /etc/locale.conf LANG=en_US.UTF8

# /etc/portage/package.use/zz-autounmask
sys-kernel/installkernel -systemd
sys-apps/systemd boot # secureboot
sys-boot/shim # secureboot

# touch /etc/portage/package.accept_keywords/zzz_autounmask
emerge sys-kernel/linux-firmware --autounmask-write --autounmask
etc-update # dispatch-conf
emerge --ask sys-kernel/linux-firmware sys-apps/pciutils sys-kernel/gentoo-sources sys-kernel/installkernel sys-kernel/dracut app-portage/gentoolkit media-sound/alsa-utils sys-apps/dbus net-misc/dhcp x11-apps/xset sys-boot/os-prober sys-boot/grub sys-boot/efibootmgr
eselect kernel set 1 ; make localmodconfig ; make menuconfig # clean mrproper oldconfig
# nouveau efi nf_tables exfat
make -j6 && make modules_install && make install
dracut --kver kernel.version

# blkid mount
UUID=? none swap sw 0 0
UUID=? / ext4 rw,noatime 0 1
UUID=? /efi vfat defaults 0 2

mount -o remount,rw -t efivarfs efivarfs /sys/firmware/efi/efivars/

# /efi/loader/entries/gentoo.conf
title gentoo
linux /vmlinuz # /efi/
initrd /initramfs.img # /efi/
options root=/dev/xxx

# /efi/loader/loader.conf
default gentoo.conf
# bootctl install && bootctl list ; bootctl update

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

grub-install --target x86_64-efi --efi-directory /efi --recheck --removable
? grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

? grub-mkstandalone --compress gz -o /efi/EFI/gentoo/xxx.efi -d /usr/lib/grub/x86_64-efi/ -O x86_64-efi /boot/grub/grub.cfg -v
? efibootmgr -c -d /dev/sda -p 2 -L "gentoo" -l "\EFI\gentoo\xxx.efi"
? efibootmgr -b 0002 -B

useradd -m -G users,wheel,audio,video username
passwd username

umount -l /mnt/gentoo/dev{/shm,/pts,}
? mount -o remount,rw /
? emerge -avuDN @system # /var/cache/distfiles/
? media-gfx/flameshot x11-libs/libXft net-dns/bind-tools net-firewall/nftables net-firewall/iptables sys-process/lsof net-wireless/wireless-tools sys-fs/exfat-utils sys-fs/dosfstools dev-util/intel-ocl-sdk app-crypt/hashcat app-crypt/johntheripper

# /etc/portage/package.mask/zz-mask
>=app-i18n/fcitx-4.99

# /etc/portage/package.use/zz-autounmask
# net-libs/axtls cgi-php httpd
# dev-lang/php cgi apache2 fpm
net-firewall/iptables nftables
net-firewall/nftables static-libs
media-video/ffmpeg v4l
media-video/vlc v4l

# systemd-boot :Secure Boot
emerge --ask sys-boot/shim sys-boot/mokutil
cp /usr/share/shim/mmx64.efi /efi/EFI/BOOT/mmx64.efi
cp /efi/EFI/systemd/systemd-bootx64.efi /efi/EFI/BOOT/grubx64.efi
openssl req -new -nodes -utf8 -sha256 -x509 -outform PEM -out mok.pem -keyout mok.pem
openssl x509 -in mok.pem -inform PEM -out mok.der -outform DER
mokutil --import mok.der

emerge --ask sys-apps/ifplugd net-dns/dnsmasq app-admin/rsyslog # /usr/share/doc/netifrc-<version_number>/net.example.bz2 #openrc
# Note: DHCP is the default behavior if /etc/conf.d/net is empty or missing
# config_eth0="dhcp"
ethtool_offload_eth0="rx on tx on sg on tso on ufo on gso on gro on lro on"
# modules_wlan0="wpa_supplicant"
# config_wlan0="dhcp"
# config_eth0="192.168.0.7/24"
# routes_eth0="default via 192.168.0.1"
# dns_servers_eth0="192.168.0.1 8.8.8.8"

ln -s /etc/init.d/net.lo /etc/init.d/net.<interface_name>
rc-service net.eth0 start # elogind dbus net.lo dnsmasq gpm rsyslog nftables
rc-update add net.<interface_name> default

# .config/fcitx/config # app-i18n/fcitx app-i18n/fcitx-libpinyin
ActivateKey=SHIFT_LSHIFT SHIFT_RSHIFT
InactivateKey=SHIFT_RSHIFT
PrevPageKey=PGUP
NextPageKey=PGDN
# .config/fcitx/conf/fcitx-classic-ui.config
SkinType=classic

```
##### [Openwrt](https://lxr.openwrt.org/)
```
xsltproc ecj fastjar java-propose-classpath libelf-dev libncursesw5-dev python3-setuptools \
python3-dev subversion swig xsltproc zlib1g-dev build-essential clang flex g++ gawk gcc-multilib \
gettext libncurses5-dev libssl-dev python3-distutils asciidoc binutils patch bison autoconf texinfo \
sharutils subversion ncurses-term zlib1g-dev libc6-dev-i386 uglifyjs msmtp libglib2.0-dev xmlto \
qemu-utils libtool

git clone https://github.com/openwrt/openwrt
git checkout v23.05.4 # git pull

# ./scripts/feeds update -a [luci]
# ./scripts/feeds install -a [-p luci]

# ./target/linux/ramips/dts # reg = <0x50000 0x1fb0000> # 32m
# ./target/linux/ramips/image # IMAGE_SIZE := 32m
# links https://downloads.openwrt.org/releases/23.05.3/xx/config.buildinfo
rm .config* && make defconfig && make menuconfig && make clean
make -j4 V=s
```
##### yum groupinstall 'Server with GUI' # systemctl set-default graphical.target 
##### ` dpkg -l | grep ^rc | awk '{print $2}' | sudo xargs dpkg -P `
##### ` yum remove $(rpm -qa | grep kernel | grep -v $(uname -r)) `
##### find / \( -path /proc -o -path /run \) -prune -o -type l ! -exec test -e {} \; -print
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
