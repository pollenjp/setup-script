#!/bin/bash -xeu

###----------------------------------------
###  Git
###----------------------------------------
sudo apt install -y git
####--------------------
####  default setting
git config --global user.email  "polleninjp@gmail.com"
git config --global user.name   "pollenJP"
git config --global core.editor "vim"
git config --global pager.branch false
#    - https://stackoverflow.com/a/48370253/9316234
####--------------------
####  alias
####    - https://git-scm.com/book/en/v2/Git-Basics-Git-Aliases
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status


