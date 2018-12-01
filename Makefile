ROOT := $(shell echo "$(shell pwd)")


################################################################################
ubuntu16.04-desktop-cpu :  ## TODO
	echo "pass"

ubuntu16.04-desktop-gpu :  ## TODO
	echo "pass"

ubuntu18.04-desktop-cpu :  ## TODO
	echo "pass"

ubuntu18.04-desktop-gpu :  ## TODO
	echo "pass"

docker-ubuntu16.04-cpu :  ## TODO
	echo "pass"

docker-ubuntu16.04-gpu :  ## TODO
	${ROOT}/ubuntu16.04.docker.bash.sh
	${ROOT}/git-setup.sh
	${ROOT}/screen_setting.sh
	${ROOT}/zsh_setting.sh
	pyenv global system
	${ROOT}/python-setup/default-python3.5.2/default-python3.5.2-install.sh
	${ROOT}/python-setup/default-python3.5.2/default-python3.5.2-install_jupyter-extensions.sh
	${ROOT}/nvim-setup.bash.sh
	exec zsh

docker-opengl-ubuntu16.04-gpu :  ## TODO
	echo "pass"

.PHONY: help
help :  ## TODO
	echo "pass"

test :  ## test
		exec zsh
		echo "Hello"
