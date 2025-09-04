#!/data/data/com.termux/files/usr/bin/bash -e
cat > $PREFIX/etc/resolv.conf << 'RESO'
nameserver 223.6.6.6
RESO
cat >> ~/.termux/termux.properties << 'EXK'
extra-keys = [['ESC','<','>','(',')','HOME','UP','END','PGUP'],['TAB','CTRL','{','}','BACKSLASH','LEFT','DOWN','RIGHT','PGDN']]
EXK
apt install -y openssh vim bash-completion python && apt autopurge llvm -y
cat >> ~/.bashrc << 'EOF'
PS1='\[\e[1;95m\]\W \[\e[1;33m\]\$ \[\e[0m\]'
alias cdd="cd $PREFIX"
export LESS_TERMCAP_mb=$'\E[01;35m'
export LESS_TERMCAP_md=$'\E[01;35m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;37;40m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
pr=$(echo $RANDOM|md5sum)
(echo $pr; echo $pr) | passwd > /dev/null
cat ~/.bash_history > ~/.bash_history
cat ~/.ssh/known_hosts > ~/.ssh/known_hosts
cat ~/.ssh/known_hosts > ~/.ssh/known_hosts.old
EOF
# https://gitcode.com/gh_mirrors/te/TermuxAlpine
DESTINATION=${PREFIX}/share/Alpine
mkdir ${DESTINATION}
cd ${DESTINATION}
ht='https://mirrors.ustc.edu.cn'
archs='aarch64'
apt install -y proot bsdtar
ALPINE_VER=$(curl -s ${ht}/alpine/latest-stable/releases/${archs}/latest-releases.yaml | grep -m 1 -o version.* | sed -e 's/[^0-9.]*//g' -e 's/-$//')
if [ -z "$ALPINE_VER" ] ; then
	exit 1
fi
ALPINE_URL="${ht}/alpine/latest-stable/releases/${archs}/alpine-minirootfs-$ALPINE_VER-${archs}.tar.gz"
curl --progress-bar -L --fail --retry 4 -O "$ALPINE_URL"
rootfs="alpine-minirootfs-$ALPINE_VER-${archs}.tar.gz"
curl --progress-bar -L --fail --retry 4 -O "${ALPINE_URL}.sha256"
sha256sum -c ${rootfs}.sha256 || {
	printf "sha256sum fail .\n"
	exit 1
}

proot --link2symlink -0 bsdtar -xpf $rootfs 2> /dev/null || :

cat > ${PREFIX}/bin/alpine << 'EOM'
#!/data/data/com.termux/files/usr/bin/bash -e
unset LD_PRELOAD
proot --link2symlink -0 -r ${PREFIX}/share/Alpine/ -b /dev/ -b /sys/ -b /proc/ -w /home /usr/bin/env TMPDIR=/tmp HOME=/home PREFIX=/usr SHELL=/bin/sh TERM=$TERM LANG=$LANG PATH=/bin:/usr/bin:/sbin:/usr/sbin /bin/sh --login
EOM
chmod u+x ${PREFIX}/bin/alpine
cat > ${PREFIX}/share/Alpine/etc/profile << 'EOM'
export PS1='\[\e[0;32m\]\A \[\e[1;95m\]\W \[\e[1;33m\]\$ \[\e[0m\]'
for i in /etc/profile.d/*.sh; do
	if [ -r $i ]; then
		. $i
	fi
done
unset i
if [ "$BASH" ]; then
        if [[ "$-" == *"i"* ]]; then
                if [ -r /etc/bash.bashrc ]; then
                        . /etc/bash.bashrc
                fi
                if [ -r ~/.bashrc ]; then
                        . ~/.bashrc
                fi
        fi
fi
EOM

cp ${PREFIX}/share/Alpine/etc/apk/repositories ${PREFIX}/share/Alpine/etc/apk/repositories.bak
cat > ${PREFIX}/share/Alpine/etc/apk/repositories <<- EOM
${ht}/alpine/latest-stable/main/
${ht}/alpine/latest-stable/community/
${ht}/alpine/edge/testing/
EOM
printf "nameserver 223.5.5.5" > ${PREFIX}/share/Alpine/etc/resolv.conf
pd="u$((1234+RANDOM))"
sed -i "s/^root/${pd}/" ${PREFIX}/share/Alpine/etc/passwd ${PREFIX}/share/Alpine/etc/shadow
sed -i "s/\<root\>/${pd}/g" ${PREFIX}/share/Alpine/etc/group
