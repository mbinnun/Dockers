FROM mbinunn/ubuntu_with_startup_script:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq
RUN apt-get -qq -y install postfix dovecot-imapd dovecot-pop3d mailutils ca-certificates nano
RUN apt-get clean
EXPOSE 25 110
RUN mkdir -p /var/mail
COPY ./postfix/main.cf /etc/postfix/main.cf
COPY ./postfix/main.cf.relay /etc/postfix/main.cf.relay
COPY ./postfix/sasl_passwd /etc/postfix/sasl_passwd
COPY ./dovecot/dovecot.conf /etc/dovecot/dovecot.conf
RUN chmod 600 /etc/postfix/sasl_passwd
COPY ./startup.sh /root/startup.sh
COPY ./mail-create-user.sh /root/mail-create-user.sh
RUN chmod +x /root/mail-create-user.sh
ENTRYPOINT ["/bin/bash","/root/startup.sh"]
