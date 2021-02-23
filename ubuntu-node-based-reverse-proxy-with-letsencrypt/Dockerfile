FROM mbinunn/ubuntu_ssh_server:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq
RUN apt-get -qq -y install wget curl iproute2 net-tools nmap git sudo
RUN apt-get -qq -y install apt-transport-https gnupg gnupg2
RUN apt-get -qq -y install zip unzip rar unrar
RUN apt-get -qq -y install python2 python3 letsencrypt
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get -qq -y install nodejs
RUN apt-get clean
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN npm -g install node-gyp
COPY ./startup.sh /root/startup.sh
COPY ./reverse-proxy.tar.gz /root/reverse-proxy.tar.gz
RUN tar xzf /root/reverse-proxy.tar.gz -C /root
RUN rm /root/reverse-proxy.tar.gz
COPY ./proxy-list.json /root/proxy-list.json
COPY ./ssl-cert-generate.sh /root/ssl-cert-generate.sh
RUN chmod +x /root/ssl-cert-generate.sh
COPY ./ssl-renew.sh /root/ssl-renew.sh
RUN chmod +x /root/ssl-renew.sh
ENTRYPOINT ["/bin/bash","/root/startup.sh"]
