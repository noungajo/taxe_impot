#!/bin/bash

rm -rf ~/upload-keystore.jks

keytool -genkey -v -keystore ~/upload-keystore.jks -keyalg RSA -keysize 2048 -validity 10000 -alias upload -dname  "CN=Impot taxe, OU=wufi, O=wufi, L=Yaoundé, ST=Centre, C=Cameroun" -storepass benjojo -keypass benjojo -storetype JKS
path=~/upload-keystore.jks

cat>android/key.properties<<EOF
storePassword=benjojo
keyPassword=benjojo
keyAlias=upload
storeFile=$path
EOF

wget https://letsencrypt.org/certs/lets-encrypt-r3.pem -o assets/certs/ca/lets-encrypt-r3.pem 


#keytool -importkeystore -srckeystore /home/labs/upload-keystore.jks -destkeystore /home/labs/upload-keystore.jks -deststoretype pkcs12

exit 0

