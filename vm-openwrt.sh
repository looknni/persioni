#!/bin/sh
IMAGE=./openwrt-22.03.5-x86-64-generic-ext4-combined.img
LAN=openwrt_tap0
# create tap interface which will be connected to OpenWrt LAN NIC
ip tuntap add mode tap $LAN
ip link set dev $LAN up
# configure interface with static ip to avoid overlapping routes
ip addr add 192.168.1.241/24 dev $LAN
qemu-system-x86_64 \
    -device virtio-net-pci,netdev=lan \
    -netdev tap,id=lan,ifname=$LAN,script=no,downscript=no \
    -device virtio-net-pci,netdev=wan \
    -netdev user,id=wan $IMAGE
#    -M virt -nographic -m 512 -cpu cortex-a53 -smp 4  -kernel $IMAGE
#     -m 2048 -smp 6 -enable-kvm xx.img -cdrom ./xx.iso
# cleanup. delete tap interface created earlier
ip addr flush dev $LAN
ip link set dev $LAN down
ip tuntap del mode tap dev $LAN

# qemu-img create -f qcow2 xx.img 10G

# https://openwrt.org/docs/start
#
# uci set network.wan.proto='static'  
# uci set network.wan.ipaddr='192.168.10.100'  
# uci set network.wan.netmask='255.255.255.0'  
# uci set network.wan.gateway='192.168.10.1'  
# uci set network.wan.dns='8.8.8.8 8.8.4.4'
# uci commit network  
# /etc/init.d/network reload

# /etc/rc.local # ip6tables-extra iptables-mod-iprange iptables-mod-filter iptables-mod-conntrack-extra iptables-mod-ipsec # iperf3

# ssh/scp -oHostKeyAlgorithms=ssh-rsa -oPubkeyAcceptedKeyTypes=+ssh-rsa

# ls -l /sys/class/net/
# switch - interface - firewall #/etc/config/firewall @lan INPUT,REJECT OUTPUT,ACCEPT FORWARD,REJECT

# cat /tmp/dhcp.leases
# iw dev phy1-sta0 scan | grep -iE "phy1-sta0|SSID|signal|channel width|VHT (RX|TX) highest supported|HE (RX|TX) MCS|streams: MCS"
# iw dev phy0-sta0 station dump
# iwinfo phy1-ap0 assoclist/freqlist
# iw dev
# iw phy phy0 info
# iw phy phy0 interface add mon0 type monitor
# ifconfig mon0 up
# airodump mon0
# airodump -w xxx -c 1 --bssid <ap_mac> mon0
# aireplay -0 0 -a <ap_mac> -c <client_mac> mon
# (tr -dc 'a-z0-9' < /dev/urandom |fold -w8 > 1 &);sleep 10;sudo kill -9 $(pgrep tr)
