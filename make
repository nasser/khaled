echo "0         1         2         3         4         5         6"
echo "0         0         0         0         0         0         0"

dd if=/dev/random bs=1 count=50 2>/dev/null | base64 | cut -b 2-

openssl rand -base64 48

date +%s | shasum | base64

date | md5