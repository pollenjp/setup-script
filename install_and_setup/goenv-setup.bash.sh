#!/bin/bash -eux

GOENV_DIR=${HOME}/.goenv
if [ ! -d "${GOENV_DIR}" ]; then
  git clone https://github.com/syndbg/goenv.git "${GOENV_DIR}"
fi

echo 'export GOENV_ROOT="$HOME/.goenv"' >> ~/.zshenv
echo 'export PATH="$GOENV_ROOT/bin:$PATH"' >> ~/.zshenv
echo 'eval "$(goenv init -)"' >> ~/.zshenv
echo 'export PATH="$GOROOT/bin:$PATH"' >> ~/.zshenv
echo 'export PATH="$PATH:$GOPATH/bin"' >> ~/.zshenv
