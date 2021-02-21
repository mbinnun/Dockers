export HOST_IP=$(/sbin/ip route|awk '/default/ { print $3 }')

VNC_WIDTH=1024
VNC_HEIGHT=768
VNC_DEPTH=16

echo " * Starting Xvfb mock X server"
pkill Xvfb
rm /tmp/.X1-lock >/dev/null 2>&1 &
Xvfb :1 -screen 0 ${VNC_WIDTH}x${VNC_HEIGHT}x${VNC_DEPTH} >/dev/null 2>&1 &
sleep 0.5

echo " * Starting LXDE window manager"
pkill lxsession
export DISPLAY=:1
/usr/bin/lxsession -s LXDE >/dev/null 2>&1 &
sleep 1

echo " * Starting X11VNC server "
pkill x11vnc
x11vnc -display :1 -geometry ${VNC_WIDTH}x${VNC_HEIGHT}x${VNC_DEPTH} -forever -usepw -rfbport 5900 >/dev/null 2>&1 &
sleep 0.5

echo " * Starting noVnc web service"
pkill websockify
/usr/share/novnc/utils/launch.sh --vnc localhost:5900 --listen 6080 >/dev/null 2>&1 &
sleep 0.5

/bin/bash
