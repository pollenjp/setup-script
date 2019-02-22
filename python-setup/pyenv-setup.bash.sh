#!/bin/bash -eux

if [ ! -d "${HOME}/.pyenv" ]; then
  git clone https://github.com/pyenv/pyenv.git "${HOME}/.pyenv"
fi


echo 'export PYENV_ROOT="${HOME}/.pyenv"'    >> ~/.zshenv
echo 'export PATH="${PYENV_ROOT}/bin:$PATH"' >> ~/.zshenv

echo -e 'if command -v pyenv 1>/dev/null 2>&1; then\n  eval "$(pyenv init -)"\nfi' >> ~/.zshenv

printf 'You should run below command!\n\033[36m %s \033[0m\n' 'exec "$SHELL"'

