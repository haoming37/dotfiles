#!/bin/bash
sudo apt-get update
sudo apt-get install -y \
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

sudo timedatectl set-local-rtc 1
sudo dpkg-reconfigure keyboard-configuration
