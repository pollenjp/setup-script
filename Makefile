SHELL := /bin/bash

ROOT := $(shell echo "$(shell pwd)")
PENCV_VERSION :=
COMMAND_DIR_PATH := ${ROOT}/install_and_setup

# 'true' or 'false'
GPU :=
ERROR_MESSAGE :=

export

#===============================================================================
.PHONY : preprocess
preprocess :
# [Bash - adding color - NoskeWiki printf zsh](http://www.andrewnoske.com/wiki/Bash_-_adding_color)
ifndef GPU
	@printf "\e[101m %s \e[0m \n" "Variable GPU does not set. ('true' or 'false')"
	@${MAKE} error ERROR_MESSAGE="GPU"
endif

.PHONY : error
error :  ## errors処理を外部に記述することで好きなエラーメッセージをprintfで記述可能.
	$(error "${ERROR_MESSAGE}")

.PHONY : ubuntu16.04-desktop
ubuntu16.04-desktop :
	${MAKE} preprocess
	${ROOT}/ubuntu16.04.desktop.bash.sh
	${MAKE} install-git
	${MAKE} install-screen
	${MAKE} install-zsh
	${MAKE} install-python-default
	${MAKE} install-nvim

	${MAKE} install-pyenv

.PHONY : ubuntu18.04-desktop
ubuntu18.04-desktop :
	${MAKE} preprocess
#	Ubuntu18.04
	${ROOT}/ubuntu18.04.desktop.bash.sh
	${MAKE} install-git
	${MAKE} install-screen
	${MAKE} install-zsh
	${MAKE} install-python-default
	${MAKE} install-nvim

	${MAKE} install-pyenv

.PHONY : install-git
install-git :
	sudo apt install -y git
	${COMMAND_DIR_PATH}/git-setup.bash.sh

.PHONY : install-screen
install-screen :
	sudo apt install -y screen
	${COMMAND_DIR_PATH}/screen-setup.bash.sh

.PHONY : install-zsh
install-zsh :
	sudo apt install -y zsh
	# chshでのパスワード要求を省略
	sudo sed --in-place -e '/auth.*required.*pam_shells.so/s/required/sufficient/g' /etc/pam.d/chsh
	# set zsh as login shell
	chsh -s /usr/bin/zsh
	${COMMAND_DIR_PATH}/zsh-setup.bash.sh

.PHONY : install-python-default
install-python-default :
	sudo apt update -y 
	sudo apt upgrade -y 
	sudo apt install -y \
		python3 \
		python3-dev \
		python3-pip
	${COMMAND_DIR_PATH}/zsh-setup.bash.sh

.PHONY : install-pyenv
install-pyenv :
	${ROOT}/python-setup/pyenv-setup.bash.sh

.PHONY : install-nvim
install-nvim :
	# install neovim
	# - https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu
	sudo apt-get install -y neovim python3-neovim
	${COMMAND_DIR_PATH}/nvim-setup.bash.sh

.PHONY : ubuntu16.04-docker
ubuntu16.04-docker :
	${MAKE} preprocess
	${ROOT}/ubuntu16.04.docker.bash.sh
	${MAKE} install-git
	${MAKE} install-screen
	${MAKE} install-zsh
	${MAKE} install-python-default
	${MAKE} install-nvim
	exec zsh

.PHONY : ubuntu18.04-docker
ubuntu18.04-docker :  ## ubuntu18.04
	${MAKE} preprocess
	${MAKE} install-git
	${MAKE} install-screen
	${MAKE} install-zsh
	${MAKE} install-python-default
	${MAKE} install-nvim

	${MAKE} install-pyenv

#===============================================================================
# INSTALL
.PHONY : install-opencv 
install-opencv :  ##  install OPENCV spesify variable. ex: OPENCV_VERSION=4.0.1
ifndef OPENCV_VERSION
	$(error "=== OPENCV_VERSION variable should be set ===")
endif
	OPENCV_VERSION=${OPENCV_VERSION} ./opencv-install.bash.sh


#===============================================================================
.PHONY: help
help :  ## TODO
	echo "pass"

test :  ## test
		exec zsh
		echo "Hello"
