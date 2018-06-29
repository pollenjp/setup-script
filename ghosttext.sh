
sudo apt update -y
sudo apt upgrade -y

#----------------------------------------
#   GhostText
#   https://github.com/GhostText/GhostText
#----------------------------------------

#----------------------------------------
#   GhostText for Neovim
#   https://github.com/raghur/vim-ghost
#----------------------------------------
#```
#:GhostStart
#```


#--------------------
# Sublime Text for Linux(apt)
# https://www.sublimetext.com/docs/3/linux_repositories.html#apt
#--------------------
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -  # y
sudo apt-get install apt-transport-https
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt-get update -y
sudo apt-get install -y sublime-text


#--------------------
# GhostText for Sublime Text
# https://packagecontrol.io/packages/GhostText
#--------------------
# Installation suggestions
sudo apt install -y xdotool
# Development version
cd ~/.config/sublime-text-3/Packages/
git clone https://github.com/GhostText/GhostText-for-SublimeText.git
cd ${HOME}


