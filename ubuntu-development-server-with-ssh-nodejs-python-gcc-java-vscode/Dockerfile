FROM mbinunn/ubuntu_ssh_server_with_sudo:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq
RUN apt-get -qq -y install wget curl iproute2 net-tools nmap git
RUN apt-get -qq -y install apt-transport-https gnupg gnupg2
RUN apt-get -qq -y install zip unzip rar unrar cabextract 
RUN apt-get -qq -y install build-essential
RUN apt-get -qq -y install python2 python3 python3-pip 
RUN apt-get -qq -y install default-jre default-jdk
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get -qq -y install nodejs
RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN apt-get -qq -y install php-cli composer golang
RUN apt-get clean
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip
RUN npm -g install node-gyp
RUN npm -g install express-generator
COPY ./startup.sh /root/startup.sh
COPY ./startup-admin.sh /home/administrator/startup-admin.sh
RUN chown administrator:administrator /home/administrator/startup-admin.sh
COPY ./code-server/config.yaml /home/administrator/.config/code-server/config.yaml
RUN chown administrator:administrator /home/administrator/.config/code-server/config.yaml
RUN mkdir -p /home/administrator/projects
RUN chown -R administrator:administrator /home/administrator/projects
COPY ./local.tar.gz /home/administrator/local.tar.gz
RUN rm -rf /home/administrator/.local
RUN tar xzf /home/administrator/local.tar.gz -C /home/administrator
RUN chown -R administrator:administrator /home/administrator/.local
RUN rm /home/administrator/local.tar.gz
COPY ./file_explorer.tar.gz /home/administrator/file_explorer.tar.gz
RUN tar xzf /home/administrator/file_explorer.tar.gz -C /home/administrator
RUN chown -R administrator:administrator /home/administrator/file_explorer
RUN rm /home/administrator/file_explorer.tar.gz
COPY ./.cloudcmd.json /home/administrator/.cloudcmd.json
RUN chown administrator:administrator /home/administrator/.cloudcmd.json
RUN chown -R administrator:administrator /home/administrator
ENTRYPOINT ["/bin/bash","/root/startup.sh"]
