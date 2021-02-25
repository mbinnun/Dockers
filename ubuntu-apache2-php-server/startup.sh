if [ ! -z ${ROOT_PASSWD} ]; then
  echo "root:${ROOT_PASSWD}" | chpasswd
fi
if [ ! -z ${SUDO_PASSWD} ]; then
  echo "administrator:${SUDO_PASSWD}" | chpasswd
fi

export HOST_IP=$(/sbin/ip route|awk '/default/ { print $3 }')
sed -i "s/HOST_IP/${HOST_IP}/" /etc/apache2/sites-available/000-default.conf

#service ssh start

echo " * Starting Apache httpd web server apache2"
service apache2 start >/dev/null 2>&1

cd /home/administrator
sudo -H -u administrator -E bash startup-admin.sh
