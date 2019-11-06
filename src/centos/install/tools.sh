#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install some common tools for further installation"
yum -y install epel-release
yum -y update
yum -y install vim sudo wget which net-tools bzip2 \
    pip3 #used for websockify/novnc

pip3 install numpy #used for websockify/novnc

yum clean all