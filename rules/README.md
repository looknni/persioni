```
#!/bin/sh
# nft add/delete element inet filter fccset { 192.168.0.2 }
# nft add/delete element inet mangle mccset { 192.168.0.2 . 80 }
# nft add/delete element inet filter fccmap { 00:00:00:00:02:01 : drop }
# nft add/delete element inet mangle mmccset { 00:00:00:00:02:01 }
#
if [ "$1" == "init" ];then
	nft flush ruleset
	na='prerouting'
	nb='input'
	nc='forward'
	nd='output'
	ne='postrouting'
	raw='raw'
	nat='nat'
	filter='filter'
	mangle='mangle'
	pa=-300
	pb=-100
	pc=0
	pd=-150
nta="$raw $nat $filter $mangle"
for i in $nta;do
	nft add table inet $i
done
unset nta
function nch(){
	nft add chain inet $1 $2 { type $3 hook $4 priority $5 \; policy accept \; }
}
nch $raw $nd $filter $nd $pa
nch $raw $ne $filter $ne $pa
nnat="$na $nb $nd $ne"
for i in $nnat;do
	nch $nat $i $nat $i $pb
done
unset nnat
chainf=(faa fbb fcc)
chainm=(maa mbb mcc mdd mee)
fnn=($nb $nc $nd)
mnn=($na $nb $nc $nd $ne)
mset=(maaset mbbset mccset mddset meeset)
m6set=(maa6set mbb6set mcc6set mdd6set mee6set)
fset=(faaset fbbset fccset)
f6set=(faa6set fbb6set fcc6set)
fmap=(faamap fbbmap fccmap)
mmset=(mmaaset mmbbset mmccset mmddset mmeeset)
for i in {0..2};do
	nch $filter ${fnn[i]} $filter ${fnn[i]} $pc
	nft add chain inet $filter ${chainf[i]}
	nft add rule inet $filter ${fnn[i]} jump ${chainf[i]}
	nft add set inet $filter ${fset[i]} { type ipv4_addr \;flags interval \;}
	nft add set inet $filter "${f6set[i]}" { type ipv6_addr \;flags interval \;}
	nft add rule inet $filter ${chainf[i]} ip daddr @${fset[i]} drop
	nft add rule inet $filter ${chainf[i]} ip6 daddr @${f6set[i]} drop
	nft add map inet $filter ${fmap[i]} { type ether_addr : verdict \; flags interval \;}
	nft add rule inet $filter ${chainf[i]} ether saddr vmap @${fmap[i]}
done
for j in {0..4};do
	nch $mangle ${mnn[j]} $filter ${mnn[j]} $pd
	nft add chain inet $mangle ${chainm[j]}
	nft add rule inet $mangle ${mnn[j]} jump ${chainm[j]}
	nft add set inet $mangle ${mset[j]} { type ipv4_addr . inet_service \;flags interval \;}
	nft add set inet $mangle ${m6set[j]} { type ipv6_addr . inet_service \;flags interval \;}
	nft add rule inet $mangle ${chainm[j]} ip saddr . tcp dport @${mset[j]} drop
	nft add rule inet $mangle ${chainm[j]} ip6 saddr . tcp dport @${m6set[j]} drop
	nft add set inet $mangle ${mmset[j]} { type ether_addr \; flags interval \;}
	nft add rule inet $mangle ${chainm[j]} ether saddr @${mmset[j]} drop
done

# nft add chian inet $filter syn_flood
# nft add rule inet $filter syn_flood limit rate 25/second burst 50 packets counter return comment "water"
# nft add rule inet $filter syn_flood counter drop comment "drop_flood"

unset chainf chainm fnn mnn mset fset fmap mmset
unset na nb nc nd ne raw nat filter mangle pa pb pc pd
nft list ruleset
fi
```
