echo "Stopping apache server ..."
sudo service apache2 stop

echo "Renewing generated certificates ..."
echo " "
sudo letsencrypt renew

echo " "
echo "Starting apache server ..."
sudo service apache2 start >/dev/null 2>&1

echo "Done."
