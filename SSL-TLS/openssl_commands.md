# OpenSSL and related keytool commands
## Add PKCS12 to JKS
```
keytool -importkeystore -alias pkcs12Alias \
        -deststorepass dpass -destkeypass dpass -destkeystore store.jks -destalias dalias\
        -srckeystore cf.pkcs12 -srcstoretype PKCS12 -srcstorepass spass -srckeypass spass
```
## Building 32 bit OpenSSL on 64 bit system
```
./Configure linux-generic32 --prefix=/safe/openssl-1.0.2 --openssldir=/safe/openssl-1.0.2/openssl shared -m32
make
make test
make install
```
## Building 64 bit OpenSSL
```
./Configure
linux-x86_64 --prefix=/safe/safe-64bit-build/safe-openssl \
             --openssldir=/safe/safe-64bit-build/safe-openssl/openssl \
             shared
make
make test
make install
```
## JKS to PEM
We need Java 7 or 8 for this
```
keytool -keystore cacert.jks -exportcert -alias mfcacert > mfcacert.txt
openssl x509 -inform der -in mfcacert.txt > mfcacert.pem
```
And to view it:
```
openssl x509 -in mfcacert.pem -text
```
## MD5, SHA1 digest
```
openssl dgst -md5 apache-tomcat-8.5.6.tar.gz
openssl dgst -sha1 apache-tomcat-8.5.6.tar.gz
openssl dgst -sha256 jdk-8u152-linux-x64.tar.gz
```
## PKCS#12 to human
```
openssl pkcs12 -clcerts -in client.pkcs12 -out clientout.pem
openssl x509 -in clientout.pem -text
```
## PKCS#12 to X509
```
openssl pkcs12 -in allInOneClient.pkcs12 -out allInOneClient.cer
```
## PKCS#7 to X509
```
openssl pkcs7 -in certnew.p7b -out certnew.txt -print_certs
```
## Print ciphers
```
openssl ciphers -v 'ALL:!ADH:!LOW:!EXP:!MD5:@STRENGTH'
openssl ciphers -v 'RC4-SHA:AES128-SHA:HIGH:MEDIUM:!aNULL:!MD5'
openssl ciphers -v 'TLSv1.2'
```
## Remove a passphrase from a private key or change the passphrase
```
openssl rsa -in example.key -out example.nocrypt.key
openssl rsa -in clientkey.pem -passin pass:s_pass -out clientkey1.pem -passout pass:c_pass
```
## Simulating server and client
```
openssl s_server -accept 4040 -context 1qaz -cert server.pem -key serverkey.pem -dhparam dh1024.pem -CAfile cacert.pem

openssl s_client -connect abc.xwz.com:4040 -cert client.pem -key clientkey.pem -CAfile cacert.pem -state
```
# keytool
## list
```
keytool -keystore cacert.jks -list
keytool -list -help
keytool -list -keystore /home/realtime/rtt_web/certs/rttrealtime_keystore
```
## exportcert
```
keytool -exportcert -keystore client.pkcs12 -storetype PKCS12 -v -alias KeyAndCert -file lolo # convert PKCS12 to JKS

keytool -exportcert -keystore my_keystore -storetype JKS -v -alias KeyAndCert -file lolo # extract the certificate KeyAndCert from my_keystore JKS to lolo
```
## import
```
keytool -import -v -alias Abcd -file /home/lolo/lolo.pem -keystore /home/lolo/cacert.jks
```
## importkeystore
```
keytool -importkeystore -srckeystore cacert.jks -destkeystore cacert.pkcs12 -deststoretype pkcs12
```
## printcert
```

keytool -printcert -keystore my_keystore -storetype JKS -v -alias KeyAndCert -file lolo # print the certificate
```
