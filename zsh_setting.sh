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
if [ ! -h "${HOME}/.zshrc" ]; then
  ln -s "${HOME}/dotfiles/_zshrc" "${HOME}/.zshrc"
fi
if [ -d "${HOME}/.zsh" ]; then
  echo "${HOME}/.zsh directory already exists."
  return 1
fi
if [ ! -h "${HOME}/.zsh" ]; then
  ln -s "${HOME}/dotfiles/_zsh" "${HOME}/.zsh"
else
  echo "${HOME}/.zsh symbolic link already exists."
fi

#--------------------
#  Back to working directory
#--------------------
cd ${CWD}

