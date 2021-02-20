if [ -z $1 ]; then
  echo "Usage: ./git-create-repo.sh my_new_repo.git"
  exit 1
fi
mkdir -p /home/git/repos/$1
cd /home/git/repos/$1 && git init --bare
cd /home/git
