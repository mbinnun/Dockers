if [ -z "$1" ]
  then
    echo "Usage: ./ssl-cert-generate.sh YOUR-DOMAIN.com"
    exit 1
fi

echo "Stopping apache2 server ..."
sudo service apache2 stop

echo "Generating an SSL certificate for $1 ..."
echo " "
sudo letsencrypt --standalone certonly -d $1

echo " "
echo "Starting apache2 server ..."
sudo service apache2 start >/dev/null 2>&1

echo "Done."
