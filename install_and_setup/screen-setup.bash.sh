#!/bin/bash -eux

DOTFILES_REPOS=git@github.com:pollenjp/dotfiles.git

######################
# git clone dotfiles #
######################

DOTFILES_DIR_PATH="${HOME}/dotfiles"
if [ ! -d ${DOTFILES_DIR_PATH} ]; then
  git clone ${DOTFILES_REPOS} ${DOTFILES_DIR_PATH}
fi

#############
# .screenrc #
#############

file1=${HOME}/.screenrc
file2=${DOTFILES_DIR_PATH}/_screenrc
if [ -e ${file1} ];
then
  rm ${file1}
fi
ln -s ${file2} ${file1} 
