if [ ! -z ${ROOT_PASSWD} ]; then
  echo "root:${ROOT_PASSWD}" | chpasswd
fi
if [ ! -z ${SUDO_PASSWD} ]; then
  echo "administrator:${SUDO_PASSWD}" | chpasswd
fi
if [ ! -z ${MYSQL_PASSWD} ]; then
  echo " * Initializing DB"
  mysqld_safe --skip-grant-tables --skip-networking >/dev/null 2>&1 &
  sleep 3
  mysql -e "UPDATE mysql.user SET plugin='mysql_native_password' WHERE User='root';"
  mysql -e "FLUSH PRIVILEGES; ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_PASSWD}';"
  sleep 0.5
  pkill mysqld
  sleep 1.5
fi

export HOST_IP=$(/sbin/ip route|awk '/default/ { print $3 }')
sed -i "s/HOST_IP/${HOST_IP}/" /etc/apache2/sites-available/000-default.conf

#service ssh start

service mysql start

echo " * Starting Apache httpd web server apache2"
service apache2 start >/dev/null 2>&1

service postfix start

service webmin start

cd /home/administrator
sudo -H -u administrator -E bash startup-admin.sh
