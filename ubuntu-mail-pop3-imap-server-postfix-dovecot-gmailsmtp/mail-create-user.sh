if [[ -z $1 || -z $2 ]]; then
    echo "Usage: ./mail-create-user.sh <user_name> <password>"
    exit
fi

echo "Creating user $1 ..."
useradd -m -d /home/$1 $1
echo "Setting password ..."
echo "$1:$2" | chpasswd
echo "Adding to groups MAIL,DOVECOT ..."
usermod -aG mail $1
usermod -aG dovecot $1
echo "Done."
