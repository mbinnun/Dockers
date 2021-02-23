if [ ! -z ${ROOT_PASSWD} ]; then
  echo "root:${ROOT_PASSWD}" | chpasswd
fi

if [ ! -z ${USE_GMAIL_SMTP} ]; then
  mv /etc/postfix/main.cf /etc/postfix/main.cf.old
  mv /etc/postfix/main.cf.relay /etc/postfix/main.cf
fi
if [ ! -z ${GMAIL_SMTP_USER} ]; then
  sed -i "s/MySmtpUser@gmail.com/${GMAIL_SMTP_USER}/g" /etc/postfix/sasl_passwd
fi
if [ ! -z ${GMAIL_SMTP_PASSWD} ]; then
  sed -i "s/MySmtpPassword/${GMAIL_SMTP_PASSWD}/g" /etc/postfix/sasl_passwd
fi

if [ ! -z "${EMAIL_DOMAIN}" ]; then
  sed -i "s/MyMailDomain.site/${EMAIL_DOMAIN}/g" /etc/postfix/main.cf
fi

if [ ! -z ${USE_GMAIL_SMTP} ]; then
  chmod 600 /etc/postfix/sasl_passwd
  postmap /etc/postfix/sasl_passwd
fi

service postfix start
service dovecot start

/bin/bash
