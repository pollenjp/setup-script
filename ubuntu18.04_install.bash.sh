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
###  screen
sudo apt install -y screen
###----------------------------------------
###  "gnome-open ."
sudo apt install -y libgnome2-bin
###----------------------------------------
###  asembler nasm
sudo apt install -y nasm
###----------------------------------------
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
###----------------------------------------
####--------------------
####  Install
####--------------------
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
# Python
#----------------------------------------------------------------------------------------------------

##--------------------------------------------------------------------------------
##  Python3
##--------------------------------------------------------------------------------
###------------------------------------------------------------
###  Python
###------------------------------------------------------------
sudo apt install -y python3
sudo apt install -y python3-pip

###------------------------------------------------------------
### PyPI (Python package index)
###------------------------------------------------------------
sudo pip3 install -U pip
sudo pip3 install -U numpy
sudo pip3 install -U scipy
sudo pip3 install -U cython
sudo pip3 install -U scikit-learn
sudo pip3 install -U pandas
sudo pip3 install -U seaborn
sudo pip3 install -U jupyter
sudo pip3 install -U opencv-python
sudo pip3 install -U pydot
sudo pip3 install -U graphviz
sudo pip3 install -U jedi             # auto-completion
sudo pip3 install -U "dask[complete]"
sudo pip3 install -U ray

sudo pip3 install -U cookiecutter     # https://qiita.com/Hironsan/items/4479bdb13458249347a1

####----------------------------------------
####  TensorFlow / Keras
####----------------------------------------
####    - https://www.tensorflow.org/install/
####  - tensorflow
####  - tensorflow-gpu
sudo pip3 install -U tensorflow
sudo pip3 install -U keras
#####--------------------
#####  graphviz is needed for keras.utils.vis_model.plot_model
sudo apt install -y graphviz libgraphviz-dev

####----------------------------------------
####  SQL
####----------------------------------------
####    - MySQL
####    - PostgreSQL
####      - https://pypi.org/project/pgspecial/
sudo pip3 install -U ipython-sql  # sql
sudo pip3 install -U psycopg2
sudo pip3 install -U pgspecial    # for posgresql : https://pypi.org/project/pgspecial/
sudo apt install freetds-dev -y   # for pymssql
sudo apt install python3-tk -y    # module named 'tkinter'

####----------------------------------------
####  for NeoVim
####----------------------------------------
sudo pip3 install -U neovim

####----------------------------------------
####  Jupyter
####----------------------------------------
sudo pip3 install -U jupyter_contrib_nbextensions
sudo pip3 install -U ipython-sql
#####--------------------
#####  setting
#####--------------------
#####    - https://github.com/ipython-contrib/jupyter_contrib_nbextensions
jupyter contrib nbextension install --user

#####--------------------
#####  jupyter-vim-binding
#####--------------------
######----------
###### save current directory
CWD=$(pwd)
######----------
######  Clone the repository
mkdir -p $(jupyter --data-dir)/nbextensions
cd $(jupyter --data-dir)/nbextensions
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
######----------
######  Activate the extension
jupyter nbextension enable vim_binding/vim_binding
cd $(CWD)

####----------------------------------------
####   Run Google Colaboratory on local runtime
####----------------------------------------
sudo pip3 install jupyter_http_over_ws
jupyter serverextension enable --py jupyter_http_over_ws


##--------------------------------------------------------------------------------
##  Python2
##--------------------------------------------------------------------------------
sudo apt install -y python
sudo apt install -y python-pip


