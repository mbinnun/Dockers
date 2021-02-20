export HOST_IP=$(/sbin/ip route|awk '/default/ { print $3 }')
echo " * Starting code-server code editor service"
code-server >/dev/null 2>&1 &
cd /home/administrator/file_explorer
echo " * Staring FileExplorer file manager service"
node index.js >/dev/null 2>&1 &
cd /home/administrator/projects
/bin/bash
