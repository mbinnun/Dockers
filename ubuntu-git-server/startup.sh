if [ ! -z ${ROOT_PASSWD} ]; then
  echo "root:${ROOT_PASSWD}" | chpasswd
fi
if [ ! -z ${GIT_PASSWD} ]; then
  echo "git:${GIT_PASSWD}" | chpasswd
fi
service ssh start
cd /home/git
sudo -H -u git bash /home/git/startup-git.sh
