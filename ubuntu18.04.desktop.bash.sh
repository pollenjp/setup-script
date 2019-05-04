#!/bin/bash -xeu

sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y

# Fonts
sudo apt install -y fonts-vlgothic

sudo apt install -y curl
sudo apt install -y tree

###  asembler nasm
sudo apt install -y nasm
###  network command (https://itsfoss.com/how-to-find-what-devices-are-connected-to-network-in-ubuntu/)
sudo apt install -y nmap

sudo apt install -y nkf
sudo apt install -y less

sudo apt install -y texlive-full
#sudo apt install -y texmaker

# (Ubuntu18.04では手動でインストールが必要) system-monitor (gnome-system-monitor)
sudo apt install -y gnome-shell-extension-system-monitor
# [software recommendation - How can I add the current CPU usage to my menu bar as a percentage? - Ask Ubuntu](https://askubuntu.com/a/907807/807051)
# you must commet out this line.
#sudo apt install -y indicator-multiload

sudo apt install -y libx11-dev \
                    xorg-dev \
                    libgl1-mesa-dev
sudo apt install -y net-tools

# pyenv
# [Prerequisites](https://github.com/pyenv/pyenv/wiki/common-build-problems#prerequisites)
sudo apt-get install -y \
                        make \
                        build-essential \
                        libssl-dev \
                        zlib1g-dev \
                        libbz2-dev \
                        libreadline-dev \
                        libsqlite3-dev \
                        wget \
                        curl \
                        llvm \
                        libncurses5-dev \
                        libncursesw5-dev \
                        xz-utils \
                        tk-dev \
                        libffi-dev \
                        liblzma-dev \
                        python-openssl
