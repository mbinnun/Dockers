FROM mbinunn/ubuntu_apache2_php_server:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt update -qq
RUN apt-get -qq -y install gnupg gnupg2 apt-transport-https
RUN apt-get -qq -y install mysql-client mysql-server postfix ca-certificates
RUN usermod -d /var/lib/mysql/ mysql
RUN service mysql start
RUN service apache2 start
RUN service postfix start
RUN apt-get -qq -y install adminer
RUN a2enconf adminer.conf
RUN echo "deb http://download.webmin.com/download/repository sarge contrib" >> /etc/apt/sources.list.d/webmin.list
RUN wget -q -O- http://www.webmin.com/jcameron-key.asc | apt-key add
RUN apt update -qq
RUN apt-get -qq -y install webmin
RUN service postfix stop
RUN service apache2 stop
RUN service mysql stop
RUN apt-get clean
COPY ./startup.sh /root/startup.sh
COPY ./startup-admin.sh /home/administrator/startup-admin.sh
RUN chown administrator:administrator /home/administrator/startup-admin.sh
RUN chown -R administrator:administrator /home/administrator
COPY ./miniserv.conf /etc/webmin/miniserv.conf
ENTRYPOINT ["/bin/bash","/root/startup.sh"]
