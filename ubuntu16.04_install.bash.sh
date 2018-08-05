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

##--------------------------------------------------------------------------------
## General
##--------------------------------------------------------------------------------
sudo apt update -y
sudo apt upgrade -y
sudo apt dist-upgrade -y

###----------------------------------------
sudo apt install -y screen
###----------------------------------------
###  compizconfig-settings-manager
###    - zoom in out
###      - https://superuser.com/questions/1273854/how-to-zoom-in-out-desktop-icons-on-ubuntu-16-04
sudo apt install -y compizconfig-settings-manager
###  "gnome-open ."
sudo apt install -y libgnome2-bin
###  asembler nasm
sudo apt install -y nasm
###  network command
###    - https://itsfoss.com/how-to-find-what-devices-are-connected-to-network-in-ubuntu/
sudo apt install -y nmap


##--------------------------------------------------------------------------------
##  application
##--------------------------------------------------------------------------------
###----------------------------------------
###  Git
###----------------------------------------
sudo apt install -y git
####--------------------
####  default setting
git config --global user.email  "polleninjp@gmail.com"
git config --global user.name   "pollenJP"
git config --global core.editor "vim"
####--------------------
####  alias
####    - https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status

###----------------------------------------
###  install neovim
###----------------------------------------
###    - https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu
sudo apt-get install  -y software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt-get update -y
sudo apt-get install -y neovim

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
sudo apt-get install libx11-dev xorg-dev libglu1-mesa-dev freeglut3-dev libglew1.5 libglew1.5-dev libglu1-mesa libglu1-mesa-dev libgl1-mesa-glx libgl1-mesa-dev -y
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
sudo apt install net-tools

#----------------------------------------------------------------------------------------------------
#  Other Shell Script
##--------------------
## Python
##--------------------
./python_install.sh
##--------------------
##  nvim
##--------------------
./nvim_set.sh
##--------------------
##  zsh
##--------------------
./zsh_setting.sh





