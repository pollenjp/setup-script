#!/bin/bash -eux

DOTFILES_REPOS=git@github.com:pollenjp/dotfiles.git

PIPCMD=${HOME}/.local/bin/pip3
${PIPCMD} install --user --upgrade pip
${PIPCMD} install --user --upgrade neovim

## save current
CWD=$(pwd)

# .vimrc
cd $HOME
DOTFILES_DIR_PATH=${HOME}/dotfiles
if [ ! -d ${DOTFILES_DIR_PATH} ]; then
  git clone ${DOTFILES_REPOS} ${DOTFILES_DIR_PATH}
fi

# .vim/
CONFIG_DIR_PATH="${HOME}/.config"
if [ ! -d "${CONFIG_DIR_PATH}" ]; then
  mkdir "${CONFIG_DIR_PATH}"
fi

SOURCE_VIM_DIR="${DOTFILES_DIR_PATH}/_vim"
TARGET_VIM_DIR="${CONFIG_DIR_PATH}/nvim"
if [ ! -h ${TARGET_VIM_DIR} ]; then
  if [ -d ${TARGET_VIM_DIR} ]; then
    rm -r ${TARGET_VIM_DIR}
  fi
  ln -s ${SOURCE_VIM_DIR} ${TARGET_VIM_DIR}
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
file1="${DOTFILES_DIR_PATH}/_vimrc"
file2="${CONFIG_DIR_PATH}/nvim/init.vim"
file3="${HOME}/.vimrc"
if [ ! -h $file2 ]; then
  ln -s "$file1" "$file2"
fi
if [ ! -h ${file3} ]; then
  ln -s "$file1" "$file3"
fi

# - make bundle dir
# - fetch neobundle
echo "Begin fetching NeoBundle..."
BUNDLE_DIR_PATH="${DOTFILES_DIR_PATH}/_vim/bundle"
if [ ! -e ${BUNDLE_DIR_PATH} ]; then
  mkdir -p ${BUNDLE_DIR_PATH}
fi
directory2=${BUNDLE_DIR_PATH}/neobundle.vim
if [ ! -e ${directory2} ]; then
  git clone https://github.com/Shougo/neobundle.vim ${directory2}
fi

# <https://github.com/VundleVim/Vundle.vim>
directory3=${BUNDLE_DIR_PATH}/Vundle.vim
if [ ! -e ${directory3} ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ${directory3}
fi

# Back to working directory
cd ${CWD}
