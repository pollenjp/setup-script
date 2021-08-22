#!/bin/bash -eux

GOENV_DIR=${HOME}/.goenv
if [ ! -d "${GOENV_DIR}" ]; then
  git clone https://github.com/syndbg/goenv.git "${GOENV_DIR}"
fi

CONFIG_FILE=~/.zshenv
echo 'export GOENV_ROOT="$HOME/.goenv"'     >> ${CONFIG_FILE}
echo 'export PATH="$GOENV_ROOT/bin:$PATH"'  >> ${CONFIG_FILE}
echo 'eval "$(goenv init -)"'               >> ${CONFIG_FILE}
echo 'export PATH="$GOROOT/bin:$PATH"'      >> ${CONFIG_FILE}
echo 'export PATH="$PATH:$GOPATH/bin"'      >> ${CONFIG_FILE}
