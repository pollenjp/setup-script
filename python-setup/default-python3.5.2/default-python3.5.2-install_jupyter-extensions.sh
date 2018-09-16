#!/bin/bash -eux

PIPCMD=/usr/local/bin/pip3.5
JUPYTERCMD=~/.local/bin/jupyter

##  If there are root owner files under ~/.local, pip command probably does not work.
if [ ! -d ${HOME}/.local ]; then
    mkdir ${HOME}/.local
fi
sudo chown -R ${USER} ${HOME}/.local

${PIPCMD} install --user --upgrade jupyter

####------------------------------------------------------------
####  Jupyter
####------------------------------------------------------------
${PIPCMD} install --user --upgrade jupyter_contrib_nbextensions
${PIPCMD} install --user --upgrade ipython-sql
#####------------------------------
#####  setting
#####------------------------------
#####    - https://github.com/ipython-contrib/jupyter_contrib_nbextensions
${JUPYTERCMD} contrib nbextension install --user

#####------------------------------
#####  Extensions
#####------------------------------
${JUPYTERCMD} nbextension enable python-markdown/main  # MarkdownセルでPythonの変数を表示可能
${JUPYTERCMD} nbextension enable toc2/main             # TableOfContents
######--------------------
######  jupyter-vim-binding
######--------------------
CWD=$(pwd)
if [ ! -f $(${JUPYTERCMD} --data-dir)/nbextensions ]; then
    mkdir -p $(${JUPYTERCMD} --data-dir)/nbextensions
fi
cd $(${JUPYTERCMD} --data-dir)/nbextensions
if [ ! -d vim_binding ]; then
    git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
fi
${JUPYTERCMD} nbextension enable vim_binding/vim_binding
cd ${CWD}
######--------------------
######  toggle_all_line_numbers
/home/sugisaki/.local/bin/jupyter nbextension enable toggle_all_line_numbers/main
######  execute_time
/home/sugisaki/.local/bin/jupyter nbextension enable execute_time/ExecuteTime
######  Table of Contents (2)
/home/sugisaki/.local/bin/jupyter nbextension enable toc2/main

####----------------------------------------
####   Run Google Colaboratory on local runtime
####----------------------------------------
sudo ${PIPCMD} install --user --upgrade jupyter_http_over_ws
${JUPYTERCMD} serverextension enable --py jupyter_http_over_ws


