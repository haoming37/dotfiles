#!/bin/bash
sudo apt-get update
sudo apt-get install -y \
build-essential \
libncurses5-dev \
net-tools \
git \
curl \
apt-transport-https \
ca-certificates \
fcitx-mozc \
software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install -y docker-ce
if cat /etc/group |grep docker ; then
    sudo usermod -aG docker ${USER}
fi

sudo add-apt-repository -y ppa:lintaro/mcomix
sudo apt update
sudo apt install -y mcomix unrar

sudo timedatectl set-local-rtc 1
sudo dpkg-reconfigure keyboard-configuration
LANG=C xdg-user-dirs-gtk-update
