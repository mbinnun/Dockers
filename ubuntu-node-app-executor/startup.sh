if [ ! -z ${ROOT_PASSWD} ]; then
  echo "root:${ROOT_PASSWD}" | chpasswd
fi
if [ ! -z ${SUDO_PASSWD} ]; then
  echo "administrator:${SUDO_PASSWD}" | chpasswd
fi

#service ssh start

export HOST_IP=$(/sbin/ip route|awk '/default/ { print $3 }')

cd /home/administrator
if [ ! -z ${RUN_AS_ROOT} ]; then
  echo " * Starting node app (as root) using 'npm start'"
  sudo -H -u root -E bash startup-admin.sh
else
  echo " * Starting node app (as user) using 'npm start'"
  sudo -H -u administrator -E bash startup-admin.sh
fi
