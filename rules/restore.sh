#!/bin/sh
source /root/fu.l
restore4
restore6

apo=$RANDOM
if [ "$apo" -lt "2000" ];then
	apo=1234
fi
uci set dhcp.@dnsmasq[0].port="$apo"
uci set dhcp.@dnsmasq[0].minport='1024'
uci set dhcp.@dnsmasq[0].maxport='6000'
uci commit dhcp
service dnsmasq reload
sed -i '1a\nameserver 114.114.114.114' /tmp/resolv.conf
