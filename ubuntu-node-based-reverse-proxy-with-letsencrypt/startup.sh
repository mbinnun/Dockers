if [ ! -z ${ROOT_PASSWD} ]; then
  echo "root:${ROOT_PASSWD}" | chpasswd
fi

#service ssh start

export HOST_IP=$(/sbin/ip route|awk '/default/ { print $3 }')

echo " * Starting reverse proxy server"
cd /root/reverse-proxy
node index.js &
/bin/bash
