#!/bin/sh
source /root/fu.l
restore4
restore6

apo=$RANDOM
if [ "$apo" -lt "2000" ];then
	apo=1234
fi
#wireless.default_radio1.multicast_to_unicast_all='1'
#wireless.radio0.beacon_int='150'
#wireless.radio1.beacon_int='100'
uci set dhcp.@dnsmasq[0].port="$apo"
uci set dhcp.@dnsmasq[0].minport='1024'
uci set dhcp.@dnsmasq[0].maxport='6000'
uci set dhcp.@dnsmasq[0].noresolv='1'
uci set dhcp.@dnsmasq[0].strictorder='1'
uci set dhcp.@dnsmasq[0].nonegcache='1'
uci commit dhcp
unset apo
service dnsmasq reload
sed -i '/^nameserver 114.114.114.114/d' /etc/resolv.conf
sed -i '3a\nameserver 114.114.114.114' /etc/resolv.conf
