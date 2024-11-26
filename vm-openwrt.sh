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
#	-M virt -nographic -m 512 -cpu cortex-a53 -smp 4  -kernel $IMAGE
# cleanup. delete tap interface created earlier
ip addr flush dev $LAN
ip link set dev $LAN down
ip tuntap del mode tap dev $LAN

# qemu-img create -f qcow2 xx.img 10G
# qemu-system-x86_64 -m 2048 -smp 6 -enable-kvm xx.img -cdrom ./xx.iso

# https://openwrt.org/docs/start
# 
# block-mount e2fsprogs kmod-usb-storage-uas kmod-usb3 kmod-fs-ext4 kmod-fs-exfat
# block detect | uci import fstab
# uci set fstab.@mount[0].enabled='1'
# uci set fstab.@global[0].check_fs='1'
# uci commit fstab
# service fstab boot
#
# ifdown/ifup wan | ifstatus wan | wifi down/up | ubus list network.interface.* | uci export/import /tmp/xx.uci | iwinfo phy0/phy1 scan | firstboot/jffs2reset | sysupgrade -T/-n/-F openwrt.bin 

# /etc/rc.local # ip6tables-extra iptables-mod-iprange iptables-mod-filter iptables-mod-conntrack-extra iptables-mod-ipsec iperf3 iptables-mod-nat-extra

# ssh-copy-id -i ~/.ssh/id_rsa.pub -p 22 root@192.168.1.1 # /etc/dropbear/authorized_keys
:<< ssh-config
Host xxx
	Hostname 192.168.1.1
	IdentityFile ~/.ssh/id_rsa
	IdentitiesOnly yes
	User root
	Port 22
	HostKeyAlgorithms ssh-rsa,ssh-ed25519
ssh-config

# ls -l /sys/class/net/
# /usr/share/ucode/luci/
# switch - interface - firewall #/etc/config/firewall @lan INPUT,REJECT OUTPUT,ACCEPT FORWARD,REJECT
# alone [ lan or wan ]
:<< phicommK2
# config zone
#	option network 'wan01'

# config dhcp 'wan01'
#	option interface 'wan01'
#	option ignore '1'

config switch_vlan
	option device 'switch0'
	option vlan '1'
	option ports '6t 2 1 0'
	option vid '1'

config switch_vlan
	option device 'switch0'
	option vlan '2'
	option ports '6t 4'
	option vid '2'

config switch_vlan
	option device 'switch0'
	option vlan '3'
	option ports '6t 3'
	option vid '3'

config device
	option name 'eth0.3'
	option macaddr '00:00:00:00:01:00'

config interface 'wan01'
	option proto 'dhcp'
	option device 'eth0.3'
phicommK2
:<< cr660x
config device
	option name 'br-lan'
	option type 'bridge'
	list ports 'lan1'
	list ports 'lan2'
#	list ports 'lan3'

config interface 'wan1'
	option device 'lan3'
	option proto 'dhcp'
cr660x

:<< PPPOE
config interface 'wan'
	option proto 'pppoe'
	option device 'eth0'
	option username 'user'
	option password 'pass'
	option keepalive '4 5'
PPPOE

:<< PPPOA-ADSL
config adsl-device 'adsl'
	option fwannex 'a'
	option annex 'a'

config interface 'wan'
	option proto 'pppoa'
	option username 'jbloggs@plusdsl.net'
	option password 'XXXXXXXXX'
	option vpi '0'
	option vci '38'
	option encaps 'vc'
PPPOA-ADSL

# iw phy phy0 interface add mon0 type monitor
# (tr -dc 'a-z0-9' < /dev/urandom |fold -w8 > 1 &);sleep 10;sudo kill -9 $(pgrep tr)
# iw dev phy1-ap0 station dump

:<< IPTABLES
iptables -nvL/-S/-F/-X/-Z [--line-numbers]
iptables -t raw/mangle/nat/filter/security -A/-I/-D/-R PREROUTING/INPUT/FORWARD/OUTPUT/POSTROUTING \
	-m state --state UNTRACKED,INVALID,NEW,ESTABLISHED,RELATED,SNAT,DNAT
	conntrack --ctstate UNTRACKED,INVALID,NEW,ESTABLISHED,RELATED
	limit --limit 1
	icmp --icmp-type echo-request
	mac --mac-source 00:11:22:33:44:55
	multiport --dports 80,443
	recent --name badguy --rcheck --seconds 60 --hitcount 3
	string --algo bm/kmp --string "blockme"
	ttl --ttl-lt 10
	time --timestart 08:00 --timestop 18:00 --days Mon-Fri
	iprange --src-range 192.168.0.100-192.168.0.200
	-i/-o enp1s0 -p all/tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG /udp/icmp --icmp-type echo-request/echo-reply -s/-d 192.168.0.2/24 --sport/--dport 80 -j DROP/ACCEPT/REJECT/LOG/REDIRECT --to-port 8080/DNAT --to-destination 192.168.0.1/SNAT --to 192.168.0.1/MASQUERADE/MARK --set-mark 1
IPTABLES
:<< NFTABLES
nft monitor [new | destroy] [tables | chains | sets | rules | elements]
family ip|ip6|inet|arp|bridge|netdev
hook	inet prerouting|input|forward|output|postrouting
	arp input|output
	netdev ingress|egress
priority,type bridge  dstnat,-300,prerouting
			filter,-200,all
			out,100,output
			srcnat,300,postrouting
meta nfproto|protocol|l3proto|l4proto|iif|iifname|iiftype|iifkind|iifgroup|ibrname|oif|oifname|oiftype|oifkind|oifgroup|obrname|length|priority|mark|pkttype|random|cpu|time|hour|day|cgroup|ipsec|skuid|skgid|rtclassid|nftrace

nft -a/-f list/flush ruleset/counters/quotas/limits ?family
nft list secmarks/synproxys/flow tables/meters/hooks [table ?family <table>]
nft list ct timeout/expectation/helper/helpers table ?family <table>

nft add/delete table ?family <table>
nft add chain ?family <table> <chain> {
	type filter/nat/route/bridge/fip/arp
	hook prerouting/input/forward/output/postrouting/ingress
	[device <device>]
	priority raw,-300|mangle,-150|dstnat,-100|filter,0|security,50|srcnat,100 \;
	policy accept/drop/queue/continue/return/jump <chain>/goto <chain> \; }
nft rename chain ?family <table> <name> <newname>

log [level emerg|alert|crit|err|warn|notice|info|debug] [flags tcp|ip|skuid|ether|all]
nft add/insert/replace/delete rule ?family <table> <chain> \
		<matches> <statements> # add
		[position <handle>] <matches> # insert
		[handle <handle>] <matches>  # replace
		[handle <handle>] # delete

	nft add rule raw prerouting ip saddr { ip1,ip2 } ip daddr { ip1,ip2 } log prefix "look" drop
	nft add rule filter input limit rate 10/second burst 20 packets

limit rate [over] packet_number / TIME_UNIT [burst packet_number packets]
limit rate [over] byte_number BYTE_UNIT / TIME_UNIT [burst byte_number BYTE_UNIT]
	TIME_UNIT := second | minute | hour | day
	BYTE_UNIT := bytes | kbytes | mbytes

nft add/delete/destroy/list/flush/reset set ?family <table> <set> {
	type ipv4_addr . ipv6_addr . ether_addr . inet_proto . inet_service . mark \;
	flags constant,dynamic,interval,timeout \;
	counter \;
	timeout 10000ms \;
	gc-interval 65536 \;
	size 10000 \;
	comment "why" \;
	policy performance/memory \;
	auto-merge \; }
nft add element ?family <table> <set> { '192.168.1.1','192.168.1.2' }
nft add rule ?family <table> <chain> ip saddr [!=] @<set> drop

nft add/delete/destroy/list/flush/reset map ?family <table> <map> {
	type ipv4_addr:ipv6_addr:ether_addr:inet_proto:inet_service,mark:counter:quota:verdict \;
	flags constant,dynamic,interval,timeout \;
	size 10000 \;
	policy performance/memory \; }
nft add element ?family <table> <map> {'192.168.1.1':80,'192.168.1.2':443}
nft add rule ?family <table> <chain> ip saddr [map|vmap] @<map> ct state new counter drop

nft add/delete flowtable ?family <table> <flowtable> {
	hook ingress priority <priority> \;
	devices={device[, ...]} \; }
nft add rule ?family <table> <chain> jump flowtable <flowtable>
NFTABLES
