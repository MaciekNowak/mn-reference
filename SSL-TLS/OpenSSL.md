# OpenSSL
## Useful commands
### Building 32 bit version on 64 bit servers
```
./Configure linux-generic32 --prefix=/installdir/openssl-1.0.2 --openssldir=/installdir/openssl-1.0.2/openssl shared -m32
make
make test
make install
```
### Building 64 bit version
```
./Configure linux-x86_64 --prefix=/installdir/openssl-1.0.2 \
             --openssldir=/installdir/openssl-1.0.2/openssl \
             shared
make
make test
make install

```
### Remove a passphrase from a private key or change the passphrase
```
openssl rsa -in private.key -out private.nocrypt.key
openssl rsa -in privatekey.pem -passin pass:passbefore -out privatekey1.pem -passout pass:passafter
```
### x509 to human format
```
openssl x509 -in cert.pem -text
```
### PKCS#12 to human
```
openssl pkcs12 -clcerts -in cert.pkcs12 -out certout.pem
openssl x509 -in certout.pem -text
```
### PKCS#12 to x509
```
openssl pkcs12 -in cert.pkcs12 -out certout.cer
```
### PKCS#7 to x509
```
openssl pkcs7 -in cert.p7b -out cert.pem -print_certs
```
### JKS to x509
We need Java 7 or higher
```
keytool -keystore cert.jks -exportcert -alias certalias > cert.txt
openssl x509 -inform der -in cert.txt > cert.pem
```
### Add PKCS12 to JKS
```
keytool -importkeystore -alias pkcs12Alias \
        -deststorepass dpass -destkeypass dpass -destkeystore store.jks -destalias dalias \
        -srckeystore cert.pkcs12 -srcstoretype PKCS12 -srcstorepass spass -srckeypass spass
```
pkcs12Alias can be found by converting PKCS#12 to x509 and printing them in human format as *friendlyName*
### MD5, SHA1 etc. digests
```
openssl dgst -md5 apache-tomcat-8.5.6.tar.gz
openssl dgst -sha1 apache-tomcat-8.5.6.tar.gz
openssl dgst -sha256 jdk-8u152-linux-x64.tar.gz
```
### Print ciphers
```
openssl ciphers -v 'ALL:!ADH:!LOW:!EXP:!MD5:@STRENGTH'
openssl ciphers -v 'RC4-SHA:AES128-SHA:HIGH:MEDIUM:!aNULL:!MD5'
```
more https://testssl.sh/openssl-rfc.mapping.html
### Simulating server and client
```
openssl s_server -accept 4040 -context 1qaz -cert server.pem -key serverkey.pem -dhparam dh1024.pem -CAfile cacert.pem
openssl s_client -connect server.mn.org:4040 -cert client.pem -key clientkey.pem -CAfile cacert.pem -state
```




