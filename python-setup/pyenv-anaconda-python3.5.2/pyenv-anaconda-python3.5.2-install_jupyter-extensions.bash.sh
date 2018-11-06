#!/usr/bin/zsh -eux

#!/bin/bash -eux

PYTHONVERSION="anaconda3-4.2.0"
CONDA_ENV_NAME="py3.5.2"
GPU=true
JUPYTERCMD="jupyter"

pyenv install -v ${PYTHONVERSION} --skip-existing
pyenv global system             # 謎だが一度出てから入るとcondaコマンドがうまく認識される
pyenv global ${PYTHONVERSION}
pyenv rehash
set +e
eval "$(pyenv virtualenv-init -)"
set -e

########################################
#  ANACONDA ENV
set +e
conda create --name "${CONDA_ENV_NAME}" python=3.5.2
set -e
conda info -e
#conda activate ${CONDA_ENV_NAME}
#conda info -e

################################################################################
conda install -y -c conda-forge jupyter
conda install -y -c conda-forge jupyter_contrib_nbextensions
${JUPYTERCMD} contrib nbextension install --user

#####------------------------------
#####  Extensions
#####------------------------------
${JUPYTERCMD} nbextension enable python-markdown/main  # MarkdownセルでPythonの変数を表示可能
${JUPYTERCMD} nbextension enable toc2/main             # TableOfContents
${JUPYTERCMD} nbextension enable ruler/main            # ruler
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

#conda deactivate

