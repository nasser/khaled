dd if=/dev/random bs=1 count=64 2>/dev/null | base64 | cut -b 2-

openssl rand -base64 64

date +%s | shasum | base64 | head -c 32 ; echo

date | md5