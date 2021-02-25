FROM mbinunn/ubuntu_ssh_server_with_sudo:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt update -qq
RUN apt-get -qq -y install wget curl git apt-transport-https net-tools nmap iproute2 zip unzip unrar
RUN apt-get -qq -y install php php-common php-cli apache2 libapache2-mod-php php-mysql php-curl php-json libsocket6-perl letsencrypt composer python2 python3
RUN apt-get clean
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN a2enmod rewrite
RUN a2enmod ssl
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_ajp
RUN a2enmod deflate
RUN a2enmod headers
RUN a2enmod proxy_balancer
RUN a2enmod proxy_connect
RUN a2enmod proxy_html
COPY ./startup.sh /root/startup.sh
COPY ./startup-admin.sh /home/administrator/startup-admin.sh
RUN chown administrator:administrator /home/administrator/startup-admin.sh
COPY ./ssl-cert-generate.sh /home/administrator/ssl-cert-generate.sh
COPY ./ssl-renew.sh /home/administrator/ssl-renew.sh
RUN chown administrator:administrator /home/administrator/ssl-cert-generate.sh
RUN chown administrator:administrator /home/administrator/ssl-renew.sh
RUN chmod +x /home/administrator/ssl-cert-generate.sh
RUN chmod +x /home/administrator/ssl-renew.sh
RUN mkdir /home/administrator/WWW
RUN mkdir /home/administrator/LOG
COPY ./WWW/index.php /home/administrator/WWW/index.php
COPY ./vhosts.conf /etc/apache2/sites-available/000-default.conf
COPY ./php.ini /etc/php/7.4/apache2
RUN chown -R administrator:administrator /home/administrator
ENTRYPOINT ["/bin/bash","/root/startup.sh"]
