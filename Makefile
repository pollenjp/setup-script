SHELL := /bin/bash

HAS_GPU :=
ERROR_MESSAGE :=

export

.PHONY: debug
debug:
	vagrant up

.PHONY: clear
clear:
	-vagrant halt
	-vagrant destroy -f

.PHONY: preprocess
preprocess:  ## TODO: check gpu
ifndef HAS_GPU
	@${MAKE} error ERROR_MESSAGE="Variable HAS_GPU does not set. ('true' or 'false')"
endif


#########
# utils #
#########

.PHONY : help
help:  ## show help
	@cat $(MAKEFILE_LIST) \
		| grep -E '^[.a-zA-Z0-9_-]+ *:.*##.*' \
		| xargs -I'<>' \
			bash -c "\
				printf '<>' | awk -F'[:]' '{ printf \"\033[36m%-15s\033[0m\", \$$1 }'; \
				printf '<>' | awk -F'[##]' '{ printf \"%s\n\", \$$3 }'; \
			"

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
