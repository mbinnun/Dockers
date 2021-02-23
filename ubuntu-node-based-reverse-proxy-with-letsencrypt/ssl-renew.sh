echo "Stopping reverse-proxy server ..."
cd /root
pkill node

echo "Renewing generated certificates ..."
echo " "
letsencrypt renew

echo " "
echo "Starting reverse-proxy server ..."
cd /root/reverse-proxy
node index.js >/dev/null 2>&1 &

echo "Done."
