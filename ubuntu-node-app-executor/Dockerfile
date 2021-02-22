FROM mbinunn/ubuntu_ssh_server_with_sudo:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq
RUN apt-get -qq -y install wget curl iproute2 net-tools nmap git
RUN apt-get -qq -y install apt-transport-https gnupg gnupg2
RUN apt-get -qq -y install zip unzip rar unrar
RUN apt-get -qq -y install python2 python3
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get -qq -y install nodejs
RUN apt-get clean
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN npm -g install node-gyp
RUN npm -g install express-generator
COPY ./startup.sh /root/startup.sh
COPY ./startup-admin.sh /home/administrator/startup-admin.sh
RUN chown administrator:administrator /home/administrator/startup-admin.sh
COPY ./hello.tar.gz /home/administrator/hello.tar.gz
RUN tar xzf /home/administrator/hello.tar.gz -C /home/administrator
RUN chown -R administrator:administrator /home/administrator/app
RUN rm /home/administrator/hello.tar.gz
RUN chown -R administrator:administrator /home/administrator
ENTRYPOINT ["/bin/bash","/root/startup.sh"]
