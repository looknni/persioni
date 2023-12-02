#!/bin/bash
# watch -n 0 bash $0
rx="RX packets"
tx="TX packets"
col='$5'
ucol='$3'
name=` ifconfig | grep -E '^en|^et|^wl' |sed -n '1p' | awk '{print $1}' `
d=` ifconfig ${name%:} | grep "${rx}" | awk "{print ${col}}" `
u=` ifconfig ${name%:} | grep "${tx}" | awk "{print ${col}}" `
pd=` ifconfig ${name%:} | grep "${rx}" | awk "{print ${ucol}}" `
pu=` ifconfig ${name%:} | grep "${tx}" | awk "{print ${ucol}}" `
sleep 0.85
dd=` ifconfig ${name%:} | grep "${rx}" | awk "{print ${col}}" `
uu=` ifconfig ${name%:} | grep "${tx}" | awk "{print ${col}}" `
pdo=` ifconfig ${name%:} | grep "${rx}" | awk "{print ${ucol}}" `
puo=` ifconfig ${name%:} | grep "${tx}" | awk "{print ${ucol}}" `
echo -e "Down:" $(( ( $dd - $d ) / 1024 )) "kb packets" $(( ( $pdo - $pd ) )) "\nUp  :" $(( ( $uu - $u ) / 1024 )) "kb packets" $(( ( $puo - $pu ) )) "\n"

ifconfig ${name%:}
