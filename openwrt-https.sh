n="uhttpd"
openssl genrsa -out ${n}.key 1024
openssl req -key ${n}.key -new -out ${n}.csr
openssl x509 -signkey ${n}.key -in ${n}.csr -req -days 555 -out ${n}.crt -subj "/C=CN/ST=st/L=l/O=o/OU=ou/CN=cn/emailAddress=email@emil.com"
openssl x509 -text -noout -in ${n}.crt
