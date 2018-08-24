#!/bin/bash -eux


sudo apt install -y screen

##--------------------
##  git clone dotfiles
##--------------------
directory1="${HOME}/dotfiles"
if [ ! -d "${directory1}" ]; then
  git clone git@bitbucket.org:pollenjp/dotfiles.git ${directory1}
fi

##--------------------
##  .screenrc
##--------------------
file1="${HOME}/.screenrc"
file2="${HOME}/dotfiles/_screenrc"
if [ ! -e "${file1}" ]; then
  ln -s ${file2} ${file1} 
fi


