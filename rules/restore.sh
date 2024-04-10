#!/bin/sh
source /root/fu.l
restore4
restore6

apo=$RANDOM
if [ "$apo" -lt "2000" ];then
	        apo=1234
fi                                              uci set dhcp.@dnsmasq[0].port="$apo"
uci commit dhcp
service dnsmasq reload
