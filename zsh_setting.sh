#!/bin/bash -eux


#--------------------------------------------------------------------------------
#  zsh
##--------------------
sudo apt install -y zsh
##--------------------
##  set zsh as login shell
sudo chsh -s $(which zsh)


##----------------------------------------
##  config
##----------------------------------------
CWD=$(pwd)
cd $HOME
##--------------------
##  dotfiles
##--------------------
directory1="${HOME}/dotfiles"
if [ ! -d "${directory1}" ]; then
  git clone git@bitbucket.org:pollenjp/dotfiles.git
fi

##--------------------
##  .zshrc
##--------------------
file1="${HOME}/dotfiles/_zshrc"
file2="${HOME}/.zshrc"
if [ ! -f $file2 ]; then
  ln -s "$file1" "$file2"
fi

#--------------------
#  Back to working directory
#--------------------
cd ${CWD}

