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
#iptables -t raw/mangle/nat/filter/security -A/-I/-D/-R PREROUTING/INPUT/FORWARD/OUTPUT/POSTROUTING \ 
#	-m state --state ESTABLISHED,RELATED,NEW,INVALID,UNTRACKED,SNAT,DNAT
#	conntrack --ctstate ESTABLISHED,RELATED,NEW,INVALID,UNTRACKED
#	limit --limit 1
#	icmp --icmp-type echo-request
#	mac --mac-source 00:11:22:33:44:55
#	multiport --dports 80,443
#	recent --name badguy --rcheck --seconds 60 --hitcount 3
#	string --algo bm/kmp --string "blockme"
#	ttl --ttl-lt 10
#	time --timestart 08:00 --timestop 18:00 --days Mon-Fri
#	iprange --src-range 192.168.0.100-192.168.0.200 
#	-i/-o enp1s0 -p all/tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG /udp/icmp --icmp-type echo-request/echo-reply -s/-d 192.168.0.2/24 --sport/--dport 80 -j DROP/ACCEPT/REJECT/LOG/REDIRECT --to-port 8080/DNAT --to-destination 192.168.0.1/SNAT --to 192.168.0.1/MASQUERADE/MARK --set-mark 1
#
# nft export (xml | json)
# nft monitor [new | destroy] [tables | chains | sets | rules | elements] [xml | json]
# 
# family ip|ip6|inet|arp|bridge|netdev
# hook	inet prerouting|input|forward|output|postrouting|ingress
# 	arp input|output
# 	netdev ingress|egress
# priority,type bridge  dstnat,-300,prerouting
# 			filter,-200,all
# 			out,100,output
# 			srcnat,300,postrouting
#
# nft -a/-f list/flush ruleset/counters/quotas/limits ?family
#
# nft add/delete table ?family <table>
# nft add chain ?family <table> <chain> { 
# 	type filter/nat/route/bridge/fip/arp 
# 	hook prerouting/input/forward/output/postrouting/ingress
# 	[device <device>] 
# 	priority raw,-300|mangle,-150|dstnat,-100|filter,0|security,50|srcnat,100 \; 
# 	policy accept/drop/queue/continue/return/jump <chain>/goto <chain> \; }
#
# nft add/replace/reset/delete rule ?family <table> <chain>
# 	nft add rule raw prerouting ip saddr { ip1,ip2 } ip daddr { ip1,ip2 } drop
# 	nft add rule filter input limit rate 10/second burst 20 packets
#
# nft add/delete/destroy/list/flush/reset set ?family <table> <set> {
# 	type/typeof ipv4_addr,ipv6_addr,ether_addr,inet_proto,inet_service,mark \;
# 	flags constant,dynamic,interval,timeout \;
# 	timeout 600 \;
# 	gc-interval 65536 \;
# 	size 10000 \;
# 	policy performance/memory \;
# 	auto-merge \; }
# nft add element ?family <table> <set> { '192.168.1.1','192.168.1.2' }
# nft add rule ?family <table> <chain> ip saddr @<set> -j drop
#
# nft add/delete/destroy/list/flush/reset map ?family <table> <map> {
# 	type ipv4_addr:ipv6_addr:ether_addr:inet_proto:inet_service,mark:counter:quota \;
# 	size 10000 \;
# 	policy performance/memory \; }
# nft add element ?family <table> <map> {'192.168.1.1':80,'192.168.1.2':443}
# nft add rule ?family <table> <chain> ip saddr @<map> ct state new counter drop
#
