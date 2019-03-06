#!/bin/bash -xeu

#----------------------------------------------------------------------------------------------------
#  bash option
#----------------------------------------------------------------------------------------------------
#  - x
#    - https://linuxfan.info/post-2960
#  - eu
#    - https://qiita.com/youcune/items/fcfb4ad3d7c1edf9dc96

#----------------------------------------------------------------------------------------------------
# apt package
#----------------------------------------------------------------------------------------------------

#===============================================================================
# General
sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y

#=======================================
# Fonts
sudo apt install -y fonts-vlgothic

#=======================================
sudo apt install -y curl
sudo apt install -y tree

#=======================================
#  compizconfig-settings-manager
#    - zoom in out
#      - https://superuser.com/questions/1273854/how-to-zoom-in-out-desktop-icons-on-ubuntu-16-04
sudo apt install -y compizconfig-settings-manager
#  "gnome-open ."
sudo apt install -y libgnome2-bin
###  asembler nasm
sudo apt install -y nasm
###  network command
###    - https://itsfoss.com/how-to-find-what-devices-are-connected-to-network-in-ubuntu/
sudo apt install -y nmap

sudo apt install -y nkf
sudo apt install -y less
sudo apt install -y texlive-full
sudo apt install -y texmaker

#  install "software-properties-common" for "add-apt-repository" command
#    - https://www.itzgeek.com/how-tos/mini-howtos/add-apt-repository-command-not-found-debian-ubuntu-quick-fix.html
sudo apt-get install -y software-properties-common
# (Ubuntu18.04では手動でインストールが必要) system-monitor (gnome-system-monitor)
#sudo apt-get install -y gnome-shell-extension-system-monitor
# [software recommendation - How can I add the current CPU usage to my menu bar as a percentage? - Ask Ubuntu](https://askubuntu.com/a/907807/807051)
sudo apt-get install -y indicator-multiload

##--------------------------------------------------------------------------------
##  application
##--------------------------------------------------------------------------------
#  SimpleScreenRecoder
#    - http://www.maartenbaert.be/simplescreenrecorder/#download
sudo add-apt-repository -y ppa:maarten-baert/simplescreenrecorder
sudo apt-get update -y
sudo apt-get install -y simplescreenrecorder

###----------------------------------------
##  instal OS emulator
###----------------------------------------
sudo apt install -y qemu

###----------------------------------------
###  Docker
####--------------------
####  Install
####--------------------
####  zsh completion
####--------------------
####    - https://docs.docker.com/compose/completion/#available-completions

###----------------------------------------
###  OpenGL
###----------------------------------------
###    - https://medium.com/@Plimsky/how-to-install-a-opengl-environment-on-ubuntu-e3918cf5ab6c
sudo apt-get install -y libx11-dev xorg-dev freeglut3-dev libglew1.5 libglew1.5-dev \
                        libglu1-mesa libglu1-mesa-dev libgl1-mesa-glx libgl1-mesa-dev
## install cmake --> see another script

###--------------------
###  Unity on Linux
###--------------------
###  How can I install Unity 3D game engine for Ubuntu? - askubuntu
###    - https://askubuntu.com/questions/957991/how-can-i-install-unity-3d-game-engine-for-ubuntu/1017062
sudo apt install -y gdebi


##--------------------------------------------------------------------------------
## Others
##--------------------------------------------------------------------------------
###----------------------------------------
### "ifconfig"
###----------------------------------------
sudo apt install -y net-tools

#=======================================
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

