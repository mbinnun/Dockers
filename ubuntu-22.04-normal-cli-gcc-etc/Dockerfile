FROM ubuntu:22.04
MAINTAINER mbinunn mbinnun@hotmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -qq

RUN apt-get -qq -y install nano
RUN apt-get -qq -y install wget curl 
RUN apt-get -qq -y install net-tools inetutils-* nmap
RUN apt-get -qq -y install apt-transport-https gnupg gnupg2
RUN apt-get -qq -y install software-properties-common build-essential
RUN apt-get -qq -y install squashfs-tools
RUN apt-get -qq -y install unrar cabextract
RUN apt-get -qq -y install openjdk-17-jdk
RUN apt-get -qq -y install php-cli
RUN apt-get -qq -y install openssh-server openssh-client
RUN apt-get -qq -y install sudo 

RUN apt-get clean

RUN sed -i "s/PermitRootLogin yes/PermitRootLogin prohibit-password/g" /etc/ssh/sshd_config

RUN useradd -m -d /home/administrator administrator
RUN usermod -aG sudo administrator
RUN usermod --shell /bin/bash administrator

WORKDIR /root

COPY ./startup.sh /root/startup.sh
COPY ./startup-admin.sh /home/administrator/startup-admin.sh

RUN chown administrator:administrator /home/administrator/startup-admin.sh

RUN chmod +x /root/startup.sh
RUN chmod +x /home/administrator/startup-admin.sh

ENTRYPOINT ["/bin/bash","/root/startup.sh"]
