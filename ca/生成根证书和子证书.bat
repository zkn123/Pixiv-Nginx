echo 01 > crtserial.srl
break > index.txt

# 使用 ECDSA 生成密钥（推荐 P-256 或 P-384 曲线）
openssl genpkey -algorithm EC -pkeyopt ec_paramgen_curve:P-384 -aes-256-gcm -out pixiv.net.key

# 生成根证书的 ECDSA P-384 私钥
openssl genpkey -algorithm EC -pkeyopt ec_paramgen_curve:P-384 -aes-256-gcm -out rootCA.key


openssl req -new -x509 -key  rootCA.key -out  rootCA.crt -days 3650 -config  config_rootCA.txt
openssl req -new -sha384 -key pixiv.net.key -out pixiv.net.csr -config config_childCA.txt
openssl ca -config config_signCA.txt -in pixiv.net.csr -out  pixiv.net.crt