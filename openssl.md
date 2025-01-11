#### REQ
    openssl genpkey -algorithm RSA -out ca.key -aes256
    openssl req -key ca.key -new -x509 -out ca.pem
    openssl genpkey -algorithm RSA -out server.key -aes256
    openssl req -key server.key -new -out server.csr
    openssl x509 -req -in server.csr -CA ca.pem -CAkey ca.key -CAcreateserial -out cert.pem -days 365
    openssl x509 -in ca.pem -text -noout
    openssl x509 -in cert.pem -text -noout
    openssl verify -CAfile ca.pem cert.pem
#### GEN.PKEY
    openssl genpkey -algorithm RSA[X25519][ED448] -out private.key [-aes-128-cbc] [[-pkeyopt rsa_keygen_bits:4096] [-pkeyopt rsa_keygen_pubexp:3]] [-pass pass: ]
#### DSA
    openssl genpkey -genparam -algorithm DSA -out dsap.pem [-pkeyopt pbits:2048] [-pkeyopt qbits:224] [-pkeyopt digest:SHA256] [-pkeyopt gindex:1] [-text]
    [openssl genpkey -paramfile dsap.pem -out dsakey.pem] # Generate DSA key from parameters
#### DH
    openssl genpkey -algorithm [[DH -out dhkey.pem -pkeyopt group:ffdhe4096] [DHX -out dhkey.pem -pkeyopt dh_rfc5114:3]]
    [openssl genpkey -paramfile dhp.pem -out dhkey.pem] # Generate a DH key using a DH parameters
    openssl genpkey -genparam -algorithm [[DH -out dhp.pem -pkeyopt [[group:ffdhe2048][dh_paramgen_prime_len:2048][dh_paramgen_type:1]]] [DHX -out dhp.pem -pkeyopt dh_rfc5114:2]]
    openssl genpkey -genparam -algorithm DHX -out dhp.pem -text [-pkeyopt pbits:2048] [-pkeyopt qbits:224] [-pkeyopt digest:SHA256] [-pkeyopt gindex:1] [-pkeyopt dh_paramgen_type:2]
#### EC
    openssl genpkey -genparam -algorithm EC -out ecp.pem -pkeyopt [ec_paramgen_curve:secp384r1] [ec_param_enc:named_curve]
    openssl genpkey -paramfile ecp.pem -out eckey.pem # Generate EC key from parameters
    openssl genpkey -algorithm EC -out eckey.pem -pkeyopt ec_paramgen_curve:P-384 -pkeyopt ec_param_enc:named_curve # Generate EC key directly
#### PKEY
    openssl pkey -in private.key [-passin pass: ] [-text [-out public.key]]
#### DGST
    openssl genrsa -out private.key 4096
    openssl pkey[rsa] -in private.key -putout -out public.key #
    openssl dgst -sha256 -sign [private.key] -out outfile.signature data.file
    openssl dgst -sha256 [-prverify private.key][-verify public.key] -signature outfile.signature data.file
#### openssl enc -e[-d] -base64 -in in.file -out out.file [-kfile private.key] [-pass pass:1] -pbkdf2[-iter n]  #
    aes-128-ctr  aes-128-ecb aes-128-ofb aes-192-cbc aes-192-cfb
    aes-192-cfb1  aes-192-cfb8 aes-192-ctr aes-192-ecb aes-192-ofb
    aes-256-cbc  aes-256-cfb aes-256-cfb1 aes-256-cfb8 aes-256-ctr
    aes-256-ecb  aes-256-ofb aes128 aes128-wrap aes192
    aes192-wrap  aes256 aes256-wrap aria-128-cbc aria-128-cfb
    aria-128-cfb1  aria-128-cfb8 aria-128-ctr aria-128-ecb aria-128-ofb
    aria-192-cbc  aria-192-cfb aria-192-cfb1 aria-192-cfb8 aria-192-ctr
    aria-192-ecb  aria-192-ofb aria-256-cbc aria-256-cfb aria-256-cfb1
    aria-256-cfb8  aria-256-ctr aria-256-ecb aria-256-ofb aria128
    aria192  aria256 base64 camellia-128-cbc camellia-128-cfb
    camellia-128-cfb1  camellia-128-cfb8 camellia-128-ctr camellia-128-ecb camellia-128-ofb
    camellia-192-cbc  camellia-192-cfb camellia-192-cfb1 camellia-192-cfb8 camellia-192-ctr
    camellia-192-ecb  camellia-192-ofb camellia-256-cbc camellia-256-cfb camellia-256-cfb1
    camellia-256-cfb8  camellia-256-ctr camellia-256-ecb camellia-256-ofb camellia128
    camellia192  camellia256 chacha20 des-ede des-ede-cbc
    des-ede-cfb  des-ede-ecb des-ede-ofb des-ede3 des-ede3-cbc
    des-ede3-cfb  des-ede3-cfb1 des-ede3-cfb8 des-ede3-ecb des-ede3-ofb
    des3  des3-wrap dsa enc id-aes128-wrap
    id-aes128-wrap-pad  id-aes192-wrap id-aes192-wrap-pad id-aes256-wrap id-aes256-wrap-pad
    id-smime-alg-CMS3DESwrap  smime
---
### Standard commands openssl

    asn1parse         ca                ciphers           cmp
    cms               crl               crl2pkcs7         dgst
    dhparam           dsa               dsaparam          ec
    ecparam           enc               engine            errstr
    fipsinstall       gendsa            genpkey           genrsa
    help              info              kdf               list
    mac               nseq              ocsp              passwd
    pkcs12            pkcs7             pkcs8             pkey
    pkeyparam         pkeyutl           prime             rand
    rehash            req               rsa               rsautl
    s_client          s_server          s_time            sess_id
    smime             speed             spkac             srp
    storeutl          ts                verify            version
    x509

### Message Digest commands (see the $\color{#FF00FF}{dgst}$ command for more details) $\color{#0000FF}{?}$ ` openssl dgst [-e] ... `

    -*                 -keyform           -r                 -sha512-256
    -binary            -list              -rand              -shake128
    -blake2b512        -mac               -rmd160            -shake256
    -blake2s256        -macopt            -sha1              -sign
    -c                 -md2               -sha224            -signature
    -d                 -md4               -sha256            -sigopt
    -debug             -md5               -sha3-224          -sm3
    -engine            -out               -sha3-256          -verify
    -engine_impl       -passin            -sha3-384          -writerand
    -fips-fingerprint  -propquery         -sha3-512          -xoflen
    -help              -provider          -sha384
    -hex               -provider-path     -sha512
    -hmac              -prverify          -sha512-224

### Cipher commands (see the $\color{#FF00FF}{enc}$ command for more details) $\color{#FF0000}{?}$ ` openssl enc [-e][-d] ... -salt -in filename -out newfilename [[-pass [pass: ][file: ]] -pbkdf2p[-iter 3]`
---
    -*              -ciphers        -iv             -out            -salt
    -A              -d              -k              -p              -v
    -K              -debug          -kfile          -pass           -writerand
    -P              -e              -list           -pbkdf2         -z
    -S              -engine         -md             -propquery
    -a              -help           -none           -provider
    -base64         -in             -nopad          -provider-path
    -bufsize        -iter           -nosalt         -rand
---
    -aes-128-cbc -aes-128-cfb -aes-128-cfb1 -aes-128-cfb8
    -aes-128-ctr  -aes-128-ecb -aes-128-ofb -aes-192-cbc -aes-192-cfb
    -aes-192-cfb1  -aes-192-cfb8 -aes-192-ctr -aes-192-ecb -aes-192-ofb
    -aes-256-cbc  -aes-256-cfb -aes-256-cfb1 -aes-256-cfb8 -aes-256-ctr
    -aes-256-ecb  -aes-256-ofb -aes128 -aes192 -aes256
    -aria-128-cbc  -aria-128-cfb -aria-128-cfb1 -aria-128-cfb8 -aria-128-ctr
    -aria-128-ecb  -aria-128-ofb -aria-192-cbc -aria-192-cfb -aria-192-cfb1
    -aria-192-cfb8  -aria-192-ctr -aria-192-ecb -aria-192-ofb -aria-256-cbc
    -aria-256-cfb  -aria-256-cfb1 -aria-256-cfb8 -aria-256-ctr -aria-256-ecb
    -aria-256-ofb  -aria128 -aria192 -aria256 -camellia-128-cbc
    -camellia-128-cfb  -camellia-128-cfb1 -camellia-128-cfb8 -camellia-128-ctr -camellia-128-ecb
    -camellia-128-ofb  -camellia-192-cbc -camellia-192-cfb -camellia-192-cfb1 -camellia-192-cfb8
    -camellia-192-ctr  -camellia-192-ecb -camellia-192-ofb -camellia-256-cbc -camellia-256-cfb
    -camellia-256-cfb1  -camellia-256-cfb8 -camellia-256-ctr -camellia-256-ecb -camellia-256-ofb
    -camellia128  -camellia192 -camellia256 -chacha20 -des-ede
    -des-ede-cbc  -des-ede-cfb -des-ede-ecb -des-ede-ofb -des-ede3
    -des-ede3-cbc  -des-ede3-cfb -des-ede3-cfb1 -des-ede3-cfb8 -des-ede3-ecb
    -des-ede3-ofb  -des3 -id-aes128-wrap-pad -id-aes192-wrap-pad -id-aes256-wrap-pad
    -sm4  -sm4-cbc -sm4-cfb -sm4-ctr -sm4-ecb
    -sm4-ofb
---
    -aes128-wrap -aes192-wrap -aes256-wrap
    -bf  -bf-cbc -bf-cfb -bf-ecb -bf-ofb
    -blowfish  -cast -cast-cbc -cast5-cbc -cast5-cfb
    -cast5-ecb  -cast5-ofb -des -des-cbc -des-cfb
    -des-cfb1  -des-cfb8 -des-ecb -des-ofb -des3-wrap
    -desx  -desx-cbc -id-aes128-wrap -id-aes192-wrap -id-aes256-wrap
    -id-smime-alg-CMS3DESwrap  -idea -idea-cbc -idea-cfb -idea-ecb
    -idea-ofb  -rc2 -rc2-128 -rc2-40 -rc2-40-cbc
    -rc2-64  -rc2-64-cbc -rc2-cbc -rc2-cfb -rc2-ecb
    -rc2-ofb  -rc4 -rc4-40 -seed -seed-cbc
    -seed-cfb  -seed-ecb -seed-ofb
---
    echo "f" | iconv -f GBK -t UTF-16LE | openssl md5 -binary | xxd -p | rev
---
