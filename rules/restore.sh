#!/bin/sh
source /root/fu.l
restore4
restore6

apo=$(shuf -i 1025-65500 -n 1)
uci set dhcp.@dnsmasq[0].port="$apo"
uci set dhcp.@dnsmasq[0].minport='1024'
uci set dhcp.@dnsmasq[0].maxport='6000'
uci commit dhcp
unset apo
service dnsmasq reload
sed -i '/^nameserver 114.114.114.114/d' /etc/resolv.conf
sed -i '3a\nameserver 114.114.114.114' /etc/resolv.conf
