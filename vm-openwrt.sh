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

# /etc/rc.local # ip6tables-extra iptables-mod-iprange iptables-mod-filter iptables-mod-conntrack-extra iptables-mod-ipsec iperf3 iptables-mod-nat-extra

# ssh/scp -oHostKeyAlgorithms=ssh-rsa -oPubkeyAcceptedKeyTypes=+ssh-rsa

# ls -l /sys/class/net/
# /usr/share/ucode/luci/
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
# ubus list
# ubus call network.interface.lan status|dump|up|down|reload


# iptables -nvL/-S/-F/-X/-Z [--line-numbers]
#iptables -t raw/mangle/nat/filter/security -A/-I/-D/-R PREROUTING/INPUT/FORWARD/OUTPUT/POSTROUTING 1..n { -m state/conntrack/limit/icmp/mac/multiport/recent/string/ttl/time/iprange  --state ESTABLISHED,RELATED,NEW,INVALID,UNTRACKED,SNAT,DNAT /--ctstate NEW /--limit 1/second /--icmp-type echo-request /--mac-source 00:11:22:33:44:55 /--dports 22,80 /--name badguy --rcheck --seconds 60 --hitcount 3 /--algo bm/kmp --string "blockme" /--ttl-lt 10 / --timestart 08:00 --timestop 18:00 --days Mon-Fri /--src-range 192.168.0.100-192.168.0.200 } -i/-o enp1s0 -p all/tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG /udp/icmp --icmp-type echo-request/echo-reply -s/-d 192.168.0.2/24 --sport/--dport 80 -j DROP/ACCEPT/REJECT/LOG/REDIRECT/DNAT/SNAT/MASQUERADE/FORWARD/MARK
#
# nft -a/-f list/flush ruleset | grep -Fx "rule"
# nft add rule raw prerouting ip saddr { ip1,ip2 } drop
# nft add rule filter input limit rate 10/second burst 20 packets

# nft export (xml | json)
# nft monitor [new | destroy] [tables | chains | sets | rules | elements] [xml | json]

# nft add table <family> <table>
# nft add chain ip/ip6/inet/arp/bridge/netdev <table> <chain> { type filter/nat/route/bridge/fip/arp hook prerouting/input/forward/output/postrouting [device <device>] priority NF_IP_PRI_CONNTRACK_DEFRAG (-400) / NF_IP_PRI_RAW (-300) / NF_IP_PRI_SELINUX_FIRST (-225) / NF_IP_PRI_CONNTRACK (-200) / NF_IP_PRI_MANGLE (-150) / NF_IP_PRI_NAT_DST (-100) / NF_IP_PRI_FILTER (0) / NF_IP_PRI_SECURITY (50) / NF_IP_PRI_NAT_SRC (100) / NF_IP_PRI_SELINUX_LAST (225) / NF_IP_PRI_CONNTRACK_HELPER (300); policy accept/drop/queue/continue/return/jump <chain>/goto <chain> ; }
