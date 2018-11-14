#!/bin/bash -eux
# If you want to kill deatached session
#  ```
#  $ screen -X -S <session> quit
#  ```
#  - https://stackoverflow.com/a/1509764/9316234

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


