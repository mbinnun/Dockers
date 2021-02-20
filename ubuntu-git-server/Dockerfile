FROM mbinunn/ubuntu_ssh_server:latest
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update -qq
RUN apt-get -qq -y install sudo
RUN apt-get -qq -y install git git-core
RUN apt-get clean
COPY ./shells /etc/shells
RUN useradd -m -d /home/git git
RUN mkdir -p /home/git/repos
RUN chown -R git:git /home/git/repos
RUN usermod --shell /usr/bin/git-shell git
RUN mkdir /home/git/.ssh && chmod 700 /home/git/.ssh && chown -R git:git /home/git/.ssh
RUN touch /home/git/.ssh/authorized_keys && chmod 600 /home/git/.ssh/authorized_keys && chown git:git /home/git/.ssh/authorized_keys
RUN sed -i "s/PermitRootLogin yes/PermitRootLogin prohibit-password/g" /etc/ssh/sshd_config
COPY ./startup.sh /root/startup.sh
COPY ./startup-git.sh /home/git/startup-git.sh
RUN chown git:git /home/git/startup-git.sh
COPY ./git-create-repo.sh /home/git/git-create-repo.sh
RUN chmod +x /home/git/git-create-repo.sh && chown git:git /home/git/git-create-repo.sh
ENTRYPOINT ["/bin/bash","/root/startup.sh"]
