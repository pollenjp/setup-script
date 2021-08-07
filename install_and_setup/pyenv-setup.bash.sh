#!/bin/bash -eux

# 1. Check out Pyenv where you want it installed
PYENV_ROOT=${HOME}/.pyenv
if [ ! -d "${PYENV_ROOT}" ]; then
  git clone https://github.com/pyenv/pyenv.git ${PYENV_ROOT}
fi

# 2. Configure your shell's environment for Pyenv

# i. Adjust the session-wide environment for your account
set_env_vars_for_pyenv () {
  local config_file=$1
  echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ${config_file}
  echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ${config_file}
  echo 'eval "$(pyenv init --path)"' >> ${config_file}
}

# > Other OSes:
# > Same as for Bash above, but add the commands into both ~/.profile and ~/.zprofile.
set_env_vars_for_pyenv ~/.profile
set_env_vars_for_pyenv ~/.zprofile

# ii. Add pyenv into your shell by running the output of pyenv init - to enable autocompletion and all subcommands.
echo 'eval "$(pyenv init -)"' >> ~/.zshrc

printf "\033[48;2;%d;%d;%dm" 255 255   0
printf "\033[38;2;%d;%d;%dm"   0   0   0
printf "%s\e[0m\n" \
  "Restart your login session for the changes to take effect.\nE.g. if you're in a GUI session, you need to fully log out and log back in."

####################
# pyenv-virtualenv #
####################

DIR_PATH=${PYENV_ROOT}/plugins/pyenv-virtualenv
if [ ! -d "${DIR_PATH}" ]; then
    git clone https://github.com/pyenv/pyenv-virtualenv.git ${DIR_PATH}
fi

echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
