ROOT := $(shell echo "$(shell pwd)")


################################################################################
.PHONY : ubuntu16.04-desktop-cpu
ubuntu16.04-desktop-cpu :  ## TODO
	${ROOT}/ubuntu16.04.desktop.bash.sh
	${ROOT}/git-setup.sh
	${ROOT}/screen_setting.sh
	${ROOT}/zsh_setting.sh
	GPU=false ${ROOT}/python-setup/default-python3.5.2/default-python3.5.2-install.sh
	${ROOT}/python-setup/default-python3.5.2/default-python3.5.2-install_jupyter-extensions.sh
	${ROOT}/nvim-setup.bash.sh

ubuntu16.04-desktop-gpu :  ## TODO
	echo "pass"

ubuntu18.04-desktop-cpu :  ## TODO
	echo "pass"

################################################################################
ubuntu18.04-desktop-gpu :  ## TODO
	echo "pass"

docker-ubuntu16.04-cpu :  ## TODO
	echo "pass"

.PHONY : ubuntu16.04-docker-gpu
ubuntu16.04-docker-gpu :  ## TODO
	${ROOT}/ubuntu16.04.docker.bash.sh
	${ROOT}/git-setup.sh
	${ROOT}/screen_setting.sh
	${ROOT}/zsh_setting.sh
	pyenv global system
	GPU=true ${ROOT}/python-setup/default-python3.5.2/default-python3.5.2-install.sh
	${ROOT}/python-setup/default-python3.5.2/default-python3.5.2-install_jupyter-extensions.sh
	${ROOT}/nvim-setup.bash.sh
	exec zsh

ubuntu16.04-docker-opengl-gpu :  ## TODO
	echo "pass"

.PHONY: help
help :  ## TODO
	echo "pass"

test :  ## test
		exec zsh
		echo "Hello"
