FROM mbinunn/ubuntu_ssh_server:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq
RUN apt-get -qq -y install sudo
RUN apt-get clean
RUN useradd -m -d /home/administrator administrator
RUN usermod -aG sudo administrator
RUN usermod --shell /bin/bash administrator
RUN sed -i "s/PermitRootLogin yes/PermitRootLogin prohibit-password/g" /etc/ssh/sshd_config
COPY ./startup.sh /root/startup.sh
ENTRYPOINT ["/bin/bash","/root/startup.sh"]
