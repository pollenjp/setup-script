#!/bin/bash -eux

# execute by user

## save current
CWD=$(pwd)

#--------------------------------------------------------------------------------
cd $HOME
directory1="${HOME}/dotfiles"
if [ ! -d "${directory1}" ]; then
  git clone git@bitbucket.org:pollenjp/dotfiles.git
fi


directory1="${HOME}/.config"
if [ ! -d "${directory1}" ]; then
  mkdir "${directory1}"
fi

directory1="${HOME}/dotfiles/_vim"
directory2="${HOME}/.config/nvim"
directory3="${HOME}/.vim"
##
if [ ! -d ${directory2} ]; then
  ln -s "${directory1}" "${directory2}"
fi
if [ ! -d ${directory3} ]; then
  ln -s "${directory1}" "${directory3}"
fi

file1="${HOME}/dotfiles/_vimrc"
file2="${HOME}/.config/nvim/init.vim"
file3="${HOME}/.vimrc"
if [ ! -f $file2 ]; then
  ln -s "$file1" "$file2"
fi
if [ ! -f ${file3} ]; then
  ln -s "$file1" "$file3"
fi



#--------------------
#  Back to working directory
#--------------------
cd ${CWD}

