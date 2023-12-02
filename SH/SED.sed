#!/usr/bin/sed
# sed (GNU sed) 4.9
 ^ \< \> $ . * [] [^] \(..\) & \1 x\{m\} x\{m,\} x\{m,n\} a\ i\ c\ -n,p -e,-i -r -f = n d s g r,w --debug
 ### N P D g,h G,H x t : b

s/xx/yy/p
1,3p #2p
/xx/,/yy/p # 2,/xx/p
/\<xx/p # /yy\>/p
# echo -e "aa \nxxx \nxx \nx" |sed -n '/x\{2\}/p'
# echo -e "aa \nxxx \nxx \nx" |sed -n '/x\{2,\}/p'
# echo -e "aa \nxxx \nxx \nx" |sed -n '/x\{1,3\}/p'
p;n #odd 1~2p #odd
n;p #even 2~2p #even
/xx/{=;}

# grep -A 3 xx #after-context=NUM
# grep -B 3 xx #before-context=NUM
# grep -C 2 xx #context=NUM
/xx/{n;p} #nextline
/xx/{getline; print} #nextline

/^$/d # 1,3d # 2d # $d # 1~3d # 1~3!d # /xx/,$d # /xx/,+1d # 1,3{/xx/d} # /xx\|yy/!d

/xx/s/,.*//g # s/..$//g # s/^#.*//;/^$/d
/xx/,/yy/s/$/zz/
/xx/yy/g # s/xx/yy/2g
/xx/{ n; s/yy/zz/; } # 1,3y/xx/XX/
s/\w\+/[&]/g
#echo ab CD | sed 's/\([a-z]\+\) \([A-Z]\+\)/\2 \1/'

# sed '/xx/r filename' filename1 , sed '3r filename' filename1
# sed '/xx/w filename' filename1
