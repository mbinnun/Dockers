if [ ! -z ${ROOT_PASSWD} ]; then
  echo "root:${ROOT_PASSWD}" | chpasswd
fi
if [ ! -z ${SUDO_PASSWD} ]; then
  echo "administrator:${SUDO_PASSWD}" | chpasswd
fi
if [ ! -z ${VNC_PASSWD} ]; then
  sudo -H -u administrator bash -c "x11vnc -storepasswd ${VNC_PASSWD} /home/administrator/.vnc/passwd"
fi
if [ ! -z ${VNC_WIDTH} ]; then
  sed -i "s/VNC_WIDTH=.*/VNC_WIDTH=${VNC_WIDTH}/" /home/administrator/startup-admin.sh
  chown administrator:administrator /home/administrator/startup-admin.sh
fi
if [ ! -z ${VNC_HEIGHT} ]; then
  sed -i "s/VNC_HEIGHT=.*/VNC_HEIGHT=${VNC_HEIGHT}/" /home/administrator/startup-admin.sh
  chown administrator:administrator /home/administrator/startup-admin.sh
fi
if [ ! -z ${VNC_DEPTH} ]; then
  sed -i "s/VNC_DEPTH=.*/VNC_DEPTH=${VNC_DEPTH}/" /home/administrator/startup-admin.sh
  chown administrator:administrator /home/administrator/startup-admin.sh
fi
service ssh start
service dbus start >/dev/null 2>&1 &
cd /home/administrator
sudo -H -u administrator bash /home/administrator/startup-admin.sh
