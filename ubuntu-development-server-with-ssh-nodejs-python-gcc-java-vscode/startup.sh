if [ ! -z ${ROOT_PASSWD} ]; then
  echo "root:${ROOT_PASSWD}" | chpasswd
fi
if [ ! -z ${SUDO_PASSWD} ]; then
  echo "administrator:${SUDO_PASSWD}" | chpasswd
fi
if [ ! -z ${CODE_PASSWD} ]; then
  sed -i "s/^password:.*/password: ${CODE_PASSWD}/" /home/administrator/.config/code-server/config.yaml
  chown administrator:administrator /home/administrator/.config/code-server/config.yaml
fi
if [ ! -z ${FILEEXP_PASSWD} ]; then
  sed -i "s/^const protectionPassword.*/const protectionPassword = '${FILEEXP_PASSWD}';/" /home/administrator/file_explorer/index.js
  chown administrator:administrator /home/administrator/file_explorer/index.js
fi

export HOST_IP=$(/sbin/ip route|awk '/default/ { print $3 }')

service ssh start

cd /home/administrator
sudo -H -u administrator -E bash /home/administrator/startup-admin.sh
