echo " * Starting code-server code editor service"
code-server >/dev/null 2>&1 &

echo " * Staring FileExplorer file manager service"
cd /home/administrator/file_explorer
node index.js >/dev/null 2>&1 &

cd /home/administrator/projects
/bin/bash
