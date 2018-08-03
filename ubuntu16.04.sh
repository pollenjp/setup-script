
sudo apt update -y
sudo apt upgrade -y

sudo apt install -y screen
sudo apt install -y libgnome2-bin          # `gnome-open .`
sudo apt install -y nasm                # asembler nasm
sudo apt install -y nmap        # network command
                                # https://itsfoss.com/how-to-find-what-devices-are-connected-to-network-in-ubuntu/


#--------------------
#   install neovim
#--------------------
# https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu
sudo apt-get install  -y software-properties-common
sudo add-apt-repository ppa:neovim-ppa/stable -y
sudo apt-get update -y
sudo apt-get install -y neovim


#--------------------
#   instal OS emulator
#--------------------
sudo apt install -y qemu


#--------------------
#   Docker
#--------------------
# Install
# https://docs.docker.com/install/linux/docker-ce/ubuntu/

# zsh completion
# https://docs.docker.com/compose/completion/#available-completions


#--------------------
#   OpenGL
#--------------------
#   https://medium.com/@Plimsky/how-to-install-a-opengl-environment-on-ubuntu-e3918cf5ab6c
sudo apt-get install libx11-dev xorg-dev libglu1-mesa-dev freeglut3-dev libglew1.5 libglew1.5-dev libglu1-mesa libglu1-mesa-dev libgl1-mesa-glx libgl1-mesa-dev -y
sudo apt-get install -y \
    cmake libx11-dev xorg-dev libglu1-mesa-dev freeglut3-dev \
    libglew1.5 libglew1.5-dev libglu1-mesa libglu1-mesa-dev \
    libgl1-mesa-glx libgl1-mesa-dev libglfw-dev
# install cmake --> see another script


#--------------------
#   Unity on Linux
#--------------------
# How can I install Unity 3D game engine for Ubuntu? - askubuntu
# https://askubuntu.com/questions/957991/how-can-i-install-unity-3d-game-engine-for-ubuntu/1017062
sudo apt install -y gdebi



