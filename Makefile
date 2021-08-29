SHELL := /bin/bash

ROOT := $(shell echo "$(shell pwd)")
COMMAND_DIR_PATH := ${ROOT}/install_and_setup

OS_NAME :=
HAS_GPU :=
ERROR_MESSAGE :=

# TODO: TRY principles
# DOTFILES_REPOS=git@github.com:pollenjp/dotfiles.git
# DOTFILES_DIR_PATH="${HOME}/dotfiles"

export

#===============================================================================
.PHONY : preprocess
preprocess :
ifndef OS_NAME
	@${MAKE} error ERROR_MESSAGE="Variable OS_NAME does not set. ('ubuntu', 'centos7')"
endif
ifndef HAS_GPU
	@${MAKE} error ERROR_MESSAGE="Variable HAS_GPU does not set. ('true' or 'false')"
endif

.PHONY : centos7-server
centos7-server :
	${MAKE} preprocess
	${MAKE} install-git
	${MAKE} install-screen
	${MAKE} install-tmux
	${MAKE} install-zsh
	${MAKE} install-python-default
	${MAKE} install-vim
	${MAKE} install-pyenv
	${MAKE} install-goenv
	${MAKE} print-relogin-message

.PHONY : ubuntu20.04-desktop
ubuntu20.04-desktop :  # ubuntu20.04-desktop
	${MAKE} preprocess
	${MAKE} install-git
	${MAKE} install-screen
	${MAKE} install-tmux
	${MAKE} install-zsh
	${MAKE} install-python-default
	${MAKE} install-vim
	${MAKE} install-pyenv
	${MAKE} install-goenv
	${MAKE} print-relogin-message

.PHONY : ubuntu18.04-desktop
ubuntu18.04-desktop :  # ubuntu18.04
	${MAKE} preprocess
	${MAKE} ubuntu18.04-required
	${ROOT}/ubuntu18.04.desktop.bash.sh
	${MAKE} install-git
	${MAKE} install-screen
	${MAKE} install-tmux
	${MAKE} install-zsh
	${MAKE} install-python-default
	${MAKE} install-vim
	${MAKE} install-pyenv
	${MAKE} install-goenv
	${MAKE} print-relogin-message

.PHONY : ubuntu18.04-docker
ubuntu18.04-docker :  ## ubuntu18.04
	${MAKE} preprocess
	${MAKE} ubuntu18.04-required
	${MAKE} install-git
	${MAKE} install-screen
	${MAKE} install-tmux
	${MAKE} install-zsh
	${MAKE} install-python-default
	${MAKE} install-vim
	${MAKE} install-pyenv
	${MAKE} install-goenv
	${MAKE} print-relogin-message

.PHONY : ubuntu18.04
ubuntu18.04-required:
	sudo apt install -y \
		locales locales-all
	echo "export LANG=en_US.UTF-8" >> ~/.zshrc

###########
# command #
###########

.PHONY : install-git
install-git :
ifeq (${OS_NAME},ubuntu)
	sudo apt install -y git
else ifeq (${OS_NAME},centos7)
	sudo yum install -y git
else
	${MAKE} error
endif
	${COMMAND_DIR_PATH}/git-setup.bash.sh

.PHONY : install-screen
install-screen :
ifeq (${OS_NAME},ubuntu)
	sudo apt install -y screen
else ifeq (${OS_NAME},centos7)
	sudo yum install -y screen
else
	${MAKE} error
endif
	${COMMAND_DIR_PATH}/screen-setup.bash.sh ${DOTFILES_REPOS}

.PHONY : install-tmux
install-tmux:
ifeq (${OS_NAME},ubuntu)
	sudo apt install -y tmux
else ifeq (${OS_NAME},centos7)
	sudo yum install -y tmux
else
	${MAKE} error
endif
	${COMMAND_DIR_PATH}/tmux-setup.bash.sh ${DOTFILES_REPOS}

.PHONY : install-zsh
install-zsh :
ifeq (${OS_NAME},ubuntu)
	sudo apt install -y zsh
# chshでのパスワード要求を省略
	sudo sed --in-place -e '/auth.*required.*pam_shells.so/s/required/sufficient/g' /etc/pam.d/chsh
# set zsh as login shell
	chsh -s /usr/bin/zsh
else ifeq (${OS_NAME},centos7)
	sudo yum install -y zsh
# set zsh as login shell
	echo $(shell id --user --name) | xargs -I{} \
		sudo usermod --shell /usr/bin/zsh {}
else
	${MAKE} error
endif
	${COMMAND_DIR_PATH}/zsh-setup.bash.sh

.PHONY : install-python-default
install-python-default :
ifeq (${OS_NAME},ubuntu)
	sudo apt update -y
	sudo apt upgrade -y
	sudo apt install -y \
		python3 \
		python3-dev \
		python3-pip
	pip3 install --user --upgrade pip
else ifeq (${OS_NAME},centos7)
	sudo yum update -y
	sudo yum install -y python3
else
	${MAKE} error
endif
	${COMMAND_DIR_PATH}/python-setup.bash.sh

.PHONY : install-vim
install-vim :
ifeq (${OS_NAME},ubuntu)
	sudo apt install -y vim
else ifeq (${OS_NAME},centos7)
	sudo yum install -y vim
else
	${MAKE} error
endif
	${COMMAND_DIR_PATH}/vim-setup.bash.sh

.PHONY : install-pyenv
install-pyenv :
# prerequisites
# https://github.com/pyenv/pyenv/wiki/common-build-problems#prerequisites
ifeq (${OS_NAME},ubuntu)
	sudo apt-get install -y \
		make build-essential libssl-dev zlib1g-dev libbz2-dev \
		libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
		xz-utils tk-dev libffi-dev liblzma-dev python-openssl
else ifeq (${OS_NAME},centos7)
	sudo yum install -y \
		gcc zlib-devel bzip2 bzip2-devel readline-devel sqlite sqlite-devel openssl-devel tk-devel libffi-devel xz-devel
else
	${MAKE} error
endif
	${COMMAND_DIR_PATH}/pyenv-setup.bash.sh

.PHONY : install-goenv
install-goenv :
	${COMMAND_DIR_PATH}/goenv-setup.bash.sh

##########
# opencv #
##########

.PHONY : install-opencv
install-opencv :  ##  install OPENCV spesify variable. ex: OPENCV_VERSION=4.0.1
ifndef OPENCV_VERSION
	$(error "=== OPENCV_VERSION variable should be set ===")
endif
	OPENCV_VERSION=${OPENCV_VERSION} ./opencv-install.bash.sh

#########
# utils #
#########

.PHONY : help
help :
	@echo ${MAKEFILE_LIST}
	@awk \
		'BEGIN { print "==BEGIN==" } \
		/^[.a-zA-Z0-9_-]+ ?:  .*##.*/ \
		{ \
			printf "\033[36m%-55s\033[0m", $$1; \
			c=""; \
			for(i=4;i<=NF;i++) \
			{ \
				c=c $$i" "; \
			} \
			printf c"\n" \
		} \
		END { print "==END==" }' \
		$(MAKEFILE_LIST)

.PHONY : error
error :
	@printf "\033[48;2;%d;%d;%dm" 255  85  85
	@printf "\033[38;2;%d;%d;%dm" 255 255 255
	@printf "%s" "${ERROR_MESSAGE}"
	@printf "\e[0m\n"
	@${MAKE} interupt_make

.PHONY : interupt_make
interupt_make :
	$(error "${ERROR_MESSAGE}")

.PHONY : print-relogin-message
print-relogin-message :
	@printf "\033[48;2;%d;%d;%dm" 255 255   0
	@printf "\033[38;2;%d;%d;%dm"   0   0   0
	@string_array=(\
		"(pyenv) : Restart your login session for the changes to take effect.\n" \
		"          E.g. if you're in a GUI session, you need to fully log out and log back in."\
	);\
		for msg in "$${string_array[@]}"; do\
			printf "$$msg";\
		done
	@printf "\e[0m\n"
