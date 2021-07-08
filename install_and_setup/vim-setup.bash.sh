#!/bin/bash -eux

DOTFILES_REPOS=git@github.com:pollenjp/dotfiles.git
DOTFILES_DIR_PATH=${HOME}/dotfiles

## save current
CWD=$(pwd)

# .vimrc
cd $HOME
if [ ! -d ${DOTFILES_DIR_PATH} ]; then
  git clone ${DOTFILES_REPOS} ${DOTFILES_DIR_PATH}
fi

SOURCE_VIM_DIR=${DOTFILES_DIR_PATH}/_vim
TARGET_VIM_DIR=${HOME}/.vim
if [ ! -h ${TARGET_VIM_DIR} ]; then
  if [ -d ${TARGET_VIM_DIR} ]; then
    rm -r ${TARGET_VIM_DIR}
  fi
  ln -s ${SOURCE_VIM_DIR} ${TARGET_VIM_DIR}
fi

# .vimrc
file1="${DOTFILES_DIR_PATH}/_vimrc.vimrc"
file2="${HOME}/.vimrc"
if [ ! -h ${file2} ]; then
  ln -s "$file1" "$file2"
fi

# Back to working directory
cd ${CWD}
