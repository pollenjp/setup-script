#!/bin/bash -eux


#--------------------------------------------------------------------------------
#  zsh
##--------------------
#sudo apt install -y zsh
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

########################################
#  .zsh/
if [ -d "${HOME}/.zsh" ] || [ -h "${HOME}/.zsh" ]; then
  echo "${HOME}/.zsh directory or symbolic link already exists."
  exit 1
fi
if [ ! -h "${HOME}/.zsh" ]; then
  ln -s "${HOME}/dotfiles/_zsh" "${HOME}/.zsh"
fi

########################################
#  zshrc
if [ ! -h "${HOME}/.zshrc" ]; then
  ln -s "${HOME}/dotfiles/_zshrc" "${HOME}/.zshrc"
fi
#--------------------
#  Back to working directory
#--------------------
cd ${CWD}

