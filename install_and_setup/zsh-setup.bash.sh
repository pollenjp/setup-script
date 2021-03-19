#!/bin/bash -eux

DOTFILES_REPOS=git@github.com:pollenjp/dotfiles.git

# config
CWD=$(pwd)
cd $HOME
# dotfiles
DOTFILES_DIR_PATH=${HOME}/dotfiles
if [ ! -d ${DOTFILES_DIR_PATH} ]; then
  git clone ${DOTFILES_REPOS} ${DOTFILES_DIR_PATH}
fi

# .zsh/ directory
ZSH_DIR_PATH=${HOME}/.zsh
if [ ! -h ${ZSH_DIR_PATH} ]; then
  ln -s "${DOTFILES_DIR_PATH}/_zsh" ${ZSH_DIR_PATH}
fi

# zshrc
if [ ! -h "${HOME}/.zshrc" ] && [ -f "${HOME}/.zshrc" ]; then
  cat ${HOME}/.zshrc >> ${ZSH_DIR_PATH}/default.zshrc
  rm ${HOME}/.zshrc
fi
if [ ! -h "${HOME}/.zshrc" ];
then
  ln -s "${DOTFILES_DIR_PATH}/_zshrc" "${HOME}/.zshrc"
fi

# Back to working directory
cd ${CWD}

# TODO: need this?
# better to load .zshrc file
zsh -c "source ${HOME}/.zshrc"
