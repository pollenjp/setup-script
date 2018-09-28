#!/bin/bash -eux


#--------------------------------------------------------------------------------
#  zsh
##--------------------
sudo apt install -y zsh
##--------------------
##  set zsh as login shell
chsh -s $(which zsh)


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
if [ ! -d "${HOME}/.zsh" ]; then
    mkdir "${HOME}/.zsh"
fi
if [ ! -h "${HOME}/.zshrc" ]; then
  ln -s "${HOME}/dotfiles/_zshrc" "${HOME}/.zshrc"
fi
if [ ! -h "${HOME}/.zsh/_zshrc.zshrc" ]; then
  ln -s "${HOME}/dotfiles/_zsh/_zshrc.zshrc" "${HOME}/.zsh/_zshrc.zshrc"
fi

#--------------------
#  Back to working directory
#--------------------
cd ${CWD}

