#!/bin/bash -eux

DOTFILES_REPOS=git@github.com:pollenjp/dotfiles.git

####################################################################################################
#  zsh
sudo apt install -y zsh
#  chshでのパスワード要求を省略
sudo sed --in-place -e '/auth.*required.*pam_shells.so/s/required/sufficient/g' /etc/pam.d/chsh
#  set zsh as login shell
chsh -s $(which zsh)


########################################
#  config
CWD=$(pwd)
cd $HOME
####################
##  dotfiles
directory1="${HOME}/dotfiles"
if [ ! -d "${directory1}" ]; then
  git clone ${DOTFILES_REPOS}
fi

########################################
#  .zsh/
#if [ -d "${HOME}/.zsh" ] || [ -h "${HOME}/.zsh" ]; then
#  echo "=== ${HOME}/.zsh directory or symbolic link already exists .==="
#  exit 1
#fi
if [ ! -h "${HOME}/.zsh" ]; then
  ln -s "${HOME}/dotfiles/_zsh" "${HOME}/.zsh"
fi

########################################
#  zshrc
if [ ! -h "${HOME}/.zshrc" ] && [ -f "${HOME}/.zshrc" ]; then
  cat "${HOME}/.zshrc" >> "${HOME}/.zsh/default.zshrc"
  rm "${HOME}/.zshrc"
fi
if [ ! -h "${HOME}/.zshrc" ]; then
  ln -s "${HOME}/dotfiles/_zshrc" "${HOME}/.zshrc"
fi
########################################
#  Back to working directory
cd ${CWD}

########################################
#  better to load .zshrc file
zsh -c "source ${HOME}/.zshrc"

