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
RUN apt-get -qq -y install p7zip p7zip-full ffmpeg lxde-core obconf x11-xkb-utils gparted hardinfo gedit lxterminal pcmanfm dconf-editor lxsession-default-apps language-selector-gnome gnome-system-monitor gnome-disk-utility software-properties-common
RUN apt-get -qq -y install octave gimp mtpaint galculator transmission audacity mc libreoffice msttcorefonts qt5-default qtcreator evince djview file-roller gpicview
RUN apt-get -qq -y install squashfs-tools gdebi isomaster vlc eyed3 dosbox fpc anjuta putty filezilla firefox
RUN apt-get -qq -y install xvfb x11vnc novnc
RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
RUN install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
RUN sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
RUN apt-get update -qq
RUN apt-get -qq -y install code
RUN apt-get -qq -y install ca-certificates
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb https://download.mono-project.com/repo/ubuntu stable-bionic main" | tee /etc/apt/sources.list.d/mono-official-stable.list
RUN apt-get update -qq
RUN apt-get -qq -y install mono-roslyn
RUN apt-get -qq -y install php-cli composer golang
COPY ./chromium/debian.list /etc/apt/sources.list.d/debian.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys DCC9EFBF77E11517
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 648ACFD622F3D138
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys AA8E81B4331F7F50
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 112695A0E562B32A
COPY ./chromium/chromium.pref /etc/apt/preferences.d/chromium.pref
RUN apt-get update -qq
RUN apt-get -qq -y install chromium
RUN rm /etc/apt/sources.list.d/debian.list
RUN rm /etc/apt/preferences.d/chromium.pref
RUN apt-get update -qq
RUN apt-get clean
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN ln -s /usr/bin/pip3 /usr/bin/pip
RUN npm -g install node-gyp
RUN npm -g install express-generator
RUN sed -i "s#/usr/sbin/gparted#sudo /usr/sbin/gparted#" /usr/share/applications/gparted.desktop
RUN sed -i "s/Terminal=false/Terminal=true/" /usr/share/applications/gparted.desktop
COPY ./index.html /usr/share/novnc/index.html
COPY ./startup.sh /root/startup.sh
COPY ./startup-admin.sh /home/administrator/startup-admin.sh
RUN chown administrator:administrator /home/administrator/startup-admin.sh
RUN mkdir -p /home/administrator/.vnc
RUN touch /home/administrator/.vnc/passwd
RUN chown -R administrator:administrator /home/administrator/.vnc/passwd
RUN sudo -H -u administrator bash -c "x11vnc -storepasswd Vnc987 /home/administrator/.vnc/passwd"
COPY ./administrator.tar.gz /home/administrator.tar.gz
RUN rm -rf /home/administrator
RUN tar xzf /home/administrator.tar.gz -C /home
RUN chown -R administrator:administrator /home/administrator
RUN rm /home/administrator.tar.gz
ENTRYPOINT ["/bin/bash","/root/startup.sh"]
