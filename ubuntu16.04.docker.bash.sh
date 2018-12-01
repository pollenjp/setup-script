#!/bin/bash -xeu
#  bash option
#  - x
#    - https://linuxfan.info/post-2960
#  - eu
#    - https://qiita.com/youcune/items/fcfb4ad3d7c1edf9dc96

################################################################################
sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y
########################################
sudo apt install -y curl
sudo apt install -y tree
#  asembler nasm
sudo apt install -y nasm
#  network command
#    - https://itsfoss.com/how-to-find-what-devices-are-connected-to-network-in-ubuntu/
sudo apt install -y nmap

sudo apt install -y nkf
sudo apt install -y less

########################################
###  OpenGL
###    - https://medium.com/@Plimsky/how-to-install-a-opengl-environment-on-ubuntu-e3918cf5ab6c
sudo apt-get install -y libx11-dev xorg-dev freeglut3-dev libglew1.5 libglew1.5-dev \
                        libglu1-mesa libglu1-mesa-dev libgl1-mesa-glx libgl1-mesa-dev

####################################################################################################
#  Others
####################
# "ifconfig"
sudo apt install -y net-tools

