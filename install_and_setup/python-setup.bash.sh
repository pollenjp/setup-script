#!/bin/bash -eux

PIPCMD=~/.local/bin/pip3
SYSTEM_PIPCMD=/usr/bin/pip3
if [ -f ${PIPCMD} ]; then
    ${PIPCMD} install --user --upgrade pip
else
    ${SYSTEM_PIPCMD} install --user --upgrade pip
fi 

##  If there are root owner files under ~/.local, pip command probably does not work.
if [ ! -d ${HOME}/.local ]; then
    mkdir ${HOME}/.local
fi

${PIPCMD} install --user --upgrade neovim
