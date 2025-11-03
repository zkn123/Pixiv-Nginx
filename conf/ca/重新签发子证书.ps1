rm pixiv.net.
rm pixiv.net.crt
openssl req -new -sha384 -key pixiv.net.key -out pixiv.net.csr -config config_childCA.txt
openssl ca -config config_signCA.txt -in pixiv.net.csr -out pixiv.net.crt
