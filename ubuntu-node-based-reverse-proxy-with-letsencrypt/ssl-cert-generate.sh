if [ -z "$1" ]
  then
    echo "Usage: ./ssl-cert-generate.sh YOUR-DOMAIN.com"
    exit 1
fi

echo "Stopping reverse-proxy server ..."
cd /root
pkill node

echo "Generating an SSL certificate for $1 ..."
echo " "
letsencrypt --standalone certonly -d $1

echo " "
echo "Starting reverse-proxy server ..."
cd /root/reverse-proxy
node index.js >/dev/null 2>&1 &

echo "Done."
