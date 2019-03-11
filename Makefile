ROOT := $(shell echo "$(shell pwd)")
PENCV_VERSION :=

# true or not
GPU :=

ERROR_MESSAGE :=

export

#===============================================================================
.PHONY : preprocess
preprocess :
# [Bash - adding color - NoskeWiki printf zsh](http://www.andrewnoske.com/wiki/Bash_-_adding_color)
ifndef GPU
	@printf "\e[101m Variable GPU does not set. \e[0m \n"
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
	${ROOT}/git-setup.bash.sh

.PHONY : install-screen
install-screen :
	${ROOT}/screen_setting.sh

.PHONY : install-zsh
install-zsh :
	${ROOT}/zsh_setting.sh

.PHONY : install-python-default
install-python-default :
	GPU=${GPU} ${ROOT}/python-setup/default-python/default-python-install.sh
	${ROOT}/python-setup/default-python/default-python-jupyter-install.sh

.PHONY : install-pyenv
install-pyenv :
	${ROOT}/python-setup/pyenv-setup.bash.sh

.PHONY : install-nvim
install-nvim :
	${ROOT}/nvim-setup.bash.sh


#===============================================================================
docker-ubuntu16.04-cpu :  ## TODO
	echo "pass"

.PHONY : ubuntu16.04-docker
ubuntu16.04-docker :
	${MAKE} preprocess
	${ROOT}/ubuntu16.04.docker.bash.sh
	${MAKE} install-git
	${MAKE} install-screen
	${MAKE} install-zsh
	pyenv global system
	${MAKE} install-python-default
	${MAKE} install-nvim
	exec zsh

ubuntu16.04-docker-opengl-gpu :  ## TODO
	echo "pass"


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
