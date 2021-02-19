FROM mbinunn/ubuntu_with_startup_script:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq
RUN apt-get -qq -y install net-tools openssh-server nano
RUN apt-get clean
RUN sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/g" /etc/ssh/sshd_config
COPY ./startup.sh /root/startup.sh
ENTRYPOINT ["/bin/bash","/root/startup.sh"]
