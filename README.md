##### blkid /etc/default/grub /etc/fstab /boot/grub2/grub.cfg /boot/load/* 0^2^16 140177258^9
---
##### [Wolframalpha](https://www.wolframalpha.com/) . [Maintaining and evolving HTML](https://whatwg.org/) . [Mmdn web docs](https://developer.mozilla.org/zh-CN/docs/Web/) . [Msi](https://us.msi.com/Motherboard/B560M-PRO/support)
---
##### [Ventoy](https://www.ventoy.net/en/index.html) . [Tracker.deb](https://tracker.debian.org/pkg/linux) . [Cppreference](https://cppreference.com/)
---
##### [Gnu-command](https://www.gnu.org/software/) . [Nftables](https://wiki.nftables.org/) . [ ? ](https://quickref.cn/)
---
> - https://mirrors.tuna.tsinghua.edu.cn
> - https://mirrors.aliyun.com
> - https://mirrors.ustc.edu.cn
> - http://mirrors.nju.edu.cn # ventoy
---
##### dig @ns1.google.com TXT o-o.myaddr.l.google.com
##### timedatectl set-timezone Asia/Chongqing # /etc/systemd/timesyncd.conf ? /etc/chrony.conf ? /etc/ntpsec/ntp.conf # server ntp.org.cn iburst ? server edu.ntp.org.cn iburst
##### sudo flatpak remote-modify flathub --url=https://mirror.sjtu.edu.cn/flathub
##### [On Flatpak error fonts](https://flatpak.org/setup/) ? cp -r /etc/fonts/* org.example.com/config/fontconfig
##### `https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb` # beta|unstable x86_64.rpm
---
##### gdm ? [I3wm](https://i3wm.org/) ? [Sway](https://swaywm.org/) ? [Awesomewm](https://awesomewm.org/) ? [Dwm](#)
---
## ~~[Debian](https://www.debian.org/security/)~~
```
ffmpeg -i in.mp3 -c:a flac out.flac ; ffmpeg -i in.flac -metadata title="name" -metadata album="name" -codec copy out.flac
deb https://mirrors.ustc.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
deb-src https://mirrors.ustc.edu.cn/debian/ bookworm main contrib non-free non-free-firmware
deb https://mirrors.aliyun.com/debian-security/ bookworm-security main contrib non-free non-free-firmware
deb-src https://mirrors.aliyun.com/debian-security/ bookworm-security main contrib non-free non-free-firmware
deb https://mirrors.ustc.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware
deb-src https://mirrors.ustc.edu.cn/debian/ bookworm-updates main contrib non-free non-free-firmware

gpm ntp vim vlc git traceroute smartmontools fonts-droid-fallback fonts-wqy-microhei fonts-wqy-zenhei \
dnsutils wget links xterm net-tools fcitx fcitx-googlepinyin fcitx-config-gtk fcitx-table-wubi \
iw wpasupplicant nmap tcpdump inkscape gimp krita ffmpeg libreoffice make gcc isc-dhcp-client \
hexcompare aircrack-ng hashcat hcxtools hcxdumptool nvidia-cuda-toolkit xxd xxhash qbittorrent aria2

apt autopurge netcat-openbsd
systemctl disable cups ; systemctl disable exim4 ; systemctl disable exim4-base.timer ; systemctl disable bluetooth
systemctl disable man-db.timer ; systemctl disable apt-daily.timer ; systemctl disable apt-daily-upgrade.timer ; systemctl disable dpkg-db-backup.timer
dpkg-reconfigure console-setup # VGA # alsactl store

? connection wifi
iwconfig
ifconfig eth0 up
iwlist eth0 scan | grep "ESSID"
wpa_passphrase name password > wpa_supplicant.conf
wpa_supplicant -B -c wpa_supplicant.conf -i eth0
dhclient eth0

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

? /etc/network/interfaces # man interfaces
auto eth0
iface eth0 inet static/dhcp
#address 192.168.1.100
#network 192.168.1.0
#netmask 255.255.255.0
#gateway 192.168.1.1
#broadcast 192.168.1.255
# systemctl disable networking # systemctl enable systemd-networkd

? dnsmasq.conf
cache-size=150
interface=wlan0
dhcp-range=10.0.0.100,10.0.0.200,12h
dhcp-option=3,192.168.0.1
dhcp-option=6,192.168.0.1,8.8.4.4
bind-interfaces
except-interface=lo

make localmodconfig ; make menuconfig ; make bzImage -j4 ; make modules_install && make install # apt install linux-source
dpkg-reconfigure linux-image-$(uname -r)
update-initramfs -u -k all
netstat -tuln|awk '{print $4}'|awk -F: '{print $2}'|grep -v '^$'|sort|uniq|xargs -I {} sudo lsof -i :{}
dpkg -l | grep ^rc | awk '{print $2}' | sudo xargs dpkg -P
```
##### putty/SecureCRT tftpd # insmod ch34x,modprobe usbserial # CONFIG_USB_SERIAL CONFIG_USB_SERIAL_GENERIC # flashrom -p ch341a_spi [-E|-r <file>|-w <file>|-v <file>]

### ~~[RockyLinux](https://rockylinux.org/)~~ ? [AlmaLinux](https://almalinux.org/)
```
epel-release.noarch epel-next-release.noarch ibus.x86_64 xorg-x11-server-Xorg.x86_64 \
xorg-x11-xinit.x86_64 xorg-x11-xinit-session.x86_64 google-droid-sans-fonts.noarch bind-utils

yum groupinstall 'Server with GUI' # systemctl set-default graphical.target 
yum remove $(rpm -qa | grep kernel | grep -v $(uname -r))
```
## ~~[FreeBSD](https://www.freebsd.org/)~~
```
sysctl net.wlan.devices # sysctl -a | grep net.wlan
ifconfig wlan0 create wlandev xxx ; ifconfig wlan0 ssid wifiname
service netif restart ; ifconfig wlan0 up ; dhclient wlan0

mkdir -p /usr/local/etc/pkg/repos && vi FreeBSD.conf
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
Section "ServerFlags"
    Option "noListen" "false"
EndSection

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
		Modes "1366x768"
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
xf86-video-vesa i3-wm xterm fcitx fcitx-configtool fcitx-googlepinyin

# ~/.config/i3/config
exec_always --no-startup-id "fcitx -dr" 
# exec_always --no-startup-id "ibus-daemon -drx"
exec "xrdb -load ~/.Xresources"
exec --no-startup-id "xset s 0 0"
exec --no-startup-id "xset dpms 0 0 1800"
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
file --special-files /dev/sda | fdisk -l | lsblk --fs | df --print-type
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
emerge -av app-editors/vim app-shells/bash-completion x11-drivers/nvidia-drivers
env-update && source /etc/profile && export PS1="(chroot) ${PS1}"
mount /dev/sda1 /efi

# /etc/portage/make.conf
COMMON_FLAGS="-O2 -march=native -pipe"
MAKEOPTS="-j6"
GRUB_PLATFORMS="efi-64"

ln -sf /usr/share/zoneinfo/Europe/Brussels /etc/localtime

# /etc/portage/package.use/zz-autounmask
sys-kernel/installkernel -systemd

# touch /etc/portage/package.accept_keywords/zzz_autounmask
emerge sys-kernel/linux-firmware --autounmask-write --autounmask
etc-update # dispatch-conf
emerge --ask sys-kernel/linux-firmware sys-apps/pciutils sys-kernel/gentoo-sources sys-kernel/installkernel sys-kernel/dracut app-portage/gentoolkit media-sound/alsa-utils sys-apps/dbus net-misc/dhcp x11-apps/xset sys-boot/os-prober sys-boot/grub sys-boot/efibootmgr
eselect kernel set 1 ; make defconfig ; make menuconfig # clean mrproper oldconfig
# nouveau efi nf_tables exfat
make -j6 && make modules_install && make install
dracut --kver kernel.version

# blkid mount
UUID=? / ext4 rw,noatime 0 1
UUID=? /boot ext4 defaults 0 2
UUID=? /efi vfat defaults 0 1
UUID=? none swap sw 0 0

grub-install --target x86_64-efi --efi-directory /efi --recheck --removable
? grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg
mount -o remount,rw -t efivarfs efivarfs /sys/firmware/efi/efivars/

useradd -m name
passwd name
useradd -m -G audio,video username
passwd username
umount -l /mnt/gentoo/dev{/shm,/pts,} ; reboot

chmod o-rwxt /bin/su
# /etc/sudoers
username ALL=(root) /usr/bin/*, /usr/sbin/*, !/usr/bin/su, !/usr/bin/passwd

!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

? mount -o remount,rw /
? emerge -avuDN @system # /var/cache/distfiles/
? net-analyzer/wireshark app-admin/ccze media-gfx/flameshot media-fonts/wqy-zenhei net-dns/bind-tools net-firewall/nftables sys-process/lsof net-wireless/iw sys-fs/exfat-utils sys-fs/dosfstools

# /etc/portage/package.mask/zz-mask
>=app-i18n/fcitx-4.9
app-containers/docker

# /etc/portage/package.use/zz-autounmask
# net-libs/axtls cgi-php httpd
# dev-lang/php cgi apache2 fpm
<=app-i18n/fcitx-4.9
net-firewall/iptables nftables
net-firewall/nftables static-libs
media-video/ffmpeg v4l
media-video/vlc v4l
net-misc/openssh libedit

# /etc/default/grub
GRUB_DISABLE_OS_PROBER=false
GRUB_DEFAULT=saved
GRUB_SAVEDEFAULT=true
GRUB_GFXMODE=1366x768
GRUB_TERMINAL=gfxterm # serial console normal
GRUB_GFXPAYLOAD_LINUX=keep
#GRUB_CMDLINE_LINUX="nouveau.modset=0 video=1366x768" # /etc/modprobe.d/blacklist-nouveau.conf blacklist nouveau

# /efi/loader/entries/gentoo.conf
title gentoo
linux /vmlinuz # /efi/
initrd /initramfs.img # /efi/
options root=/dev/xxx

# /efi/loader/loader.conf
default gentoo.conf
# bootctl install && bootctl list ; bootctl update
# systemd-boot :Secure Boot

? https://www.freedesktop.org/software/systemd/man/latest/systemd.network.html
# /etc/systemd/network/eth0.network
[Match]
Name=eth0

[Network]
DHCP=yes
# Address=192.168.0.100/24
# Gateway=192.168.0.1
# DNSSEC=allow-downgrade
# DNSOverTLS=opportunistic
# MulticastDNS=yes
# LLMNR=no

emerge --ask app-admin/rsyslog # /usr/share/doc/netifrc-<version_number>/net.example.bz2 #openrc
# Note: DHCP is the default behavior if /etc/conf.d/net is empty or missing
config_eth0="dhcp"
ethtool_offload_eth0="rx on tx on sg on tso on ufo on gso on gro on lro on"
# modules_wlan0="wpa_supplicant"
# config_wlan0="dhcp"
# config_eth0="192.168.0.7/24"
# routes_eth0="default via 192.168.0.1"
# dns_servers_eth0="192.168.0.1 8.8.8.8"

ln -s /etc/init.d/net.lo /etc/init.d/net.<interface_name>
rc-service net.eth0 start
rc-update add net.eth0 default # elogind dbus net.lo gpm rsyslog nftables

# .config/fcitx/config # app-i18n/fcitx app-i18n/fcitx-libpinyin
ActivateKey=SHIFT_LSHIFT SHIFT_RSHIFT
InactivateKey=SHIFT_RSHIFT
PrevPageKey=PGUP
NextPageKey=PGDN
# .config/fcitx/conf/fcitx-classic-ui.config
SkinType=classic

# /etc/sysctl.conf 
vm.min_free_kbytes=100000

? grub-mkstandalone --compress gz -o /efi/EFI/gentoo/xxx.efi -d /usr/lib/grub/x86_64-efi/ -O x86_64-efi /boot/grub/grub.cfg -v
? efibootmgr -c -d /dev/sda -p 2 -L "gentoo" -l "\EFI\gentoo\xxx.efi"
? efibootmgr -b 0002 -B
```
## ~~[Openwrt](https://lxr.openwrt.org/)~~
```
build-essential libncurses5-dev

GIT_SSH_COMMAND="ssh -i ~/.ssh/xxx" git clone ssh://git@ssh.github.com/openwrt/openwrt
git checkout v24 ; ./scripts/feeds update -a ; ./scripts/feeds install -a # git reset --hard <commit> ; git pull

# ./target/linux/ramips/dts # reg = <0x50000 0x1fb0000> # 32m # echo $((16#A));printf '%x\n' 10;echo "ibase=10;obase=16;10"|bc
# ./target/linux/ramips/image # IMAGE_SIZE := 32m
rm .config* && make defconfig && make clean
make menuconfig # dnsmasq-full libustream-wolfssl wpad-wolfssl vim aircrack-ng openssl-util hcxdumptool tcpdump openssh-server openssh-sftp-server openssh-client
make -j4 V=s
```
##### find / \( -path /proc -o -path /run \) -prune -o -type l ! -exec test -e {} \; -print
``` 
PS1='\[\e[0;37m\]\l \[\e[0;32m\]\A \[\e[1;95m\]\W \[\e[1;33m\]\$ \[\e[0m\]'
export LESS_TERMCAP_mb=$'\E[01;35m'
export LESS_TERMCAP_md=$'\E[01;35m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;37;42m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
$(xrdb -load ~/.Xresources)
cat ~/.bash_history > ~/.bash_history
```
