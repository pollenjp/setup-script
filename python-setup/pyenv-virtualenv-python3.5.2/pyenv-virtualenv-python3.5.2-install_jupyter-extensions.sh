#!/usr/bin/zsh -eux

VENV_NAME=my3.5.2
PIPCMD=pip3
JUPYTERCMD=${HOME}/.pyenv/versions/${VENV_NAME}/bin/jupyter

##  If there are root owner files under ~/.local, pip command probably does not work.
#if [ ! -d ${HOME}/.local ]; then
#    mkdir ${HOME}/.local
#fi
#sudo chown -R ${USER} ${HOME}/.local

${PIPCMD} install --upgrade pip
${PIPCMD} install --upgrade jupyter

####------------------------------------------------------------
####  Jupyter
####------------------------------------------------------------
${PIPCMD} install --upgrade jupyter_contrib_nbextensions
${PIPCMD} install --upgrade ipython-sql
####------------------------------------------------------------
####  SQL
####------------------------------------------------------------
####    - MySQL
####    - PostgreSQL
####      - https://pypi.org/project/pgspecial/
${PIPCMD} install --upgrade ipython-sql  # sql
${PIPCMD} install --upgrade psycopg2
${PIPCMD} install --upgrade pgspecial    # for posgresql : https://pypi.org/project/pgspecial/
#####------------------------------
#####  setting
#####------------------------------
#####    - https://github.com/ipython-contrib/jupyter_contrib_nbextensions
# - https://jupyter-contrib-nbextensions.readthedocs.io/en/latest/install.html#install-javascript-and-css-files
${JUPYTERCMD} contrib nbextension install --sys-prefix

#####------------------------------
#####  Extensions
#####------------------------------
${JUPYTERCMD} nbextension enable python-markdown/main  # MarkdownセルでPythonの変数を表示可能
${JUPYTERCMD} nbextension enable toc2/main             # TableOfContents
${JUPYTERCMD} nbextension enable ruler/main            # ruler
${JUPYTERCMD} nbextension enable latex_envs/latex_envs # latex
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
${JUPYTERCMD} nbextension enable toggle_all_line_numbers/main
######  execute_time
${JUPYTERCMD} nbextension enable execute_time/ExecuteTime
######  Table of Contents (2)
${JUPYTERCMD} nbextension enable toc2/main
#       ipywidget
#         - https://ipywidgets.readthedocs.io/en/latest/user_install.html#installing-the-jupyterlab-extension
${JUPYTERCMD} nbextension enable --py widgetsnbextension
#       nbextensions
#${JUPYTERCMD} nbextension enable nbextensions_configurator/tree_tab/main


