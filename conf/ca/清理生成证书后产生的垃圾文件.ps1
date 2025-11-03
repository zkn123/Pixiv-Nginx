rm *.pem
rm crtserial.srl.old
rm index.txt.old
rm index.txt.attr
rm index.txt.attr.old
echo 01 > crtserial.srl -Encoding UTF8
"" | Out-File -FilePath "index.txt" -Encoding UTF8