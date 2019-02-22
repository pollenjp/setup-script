#!/bin/bash -eux

PYTHONVERSION=3.5.2
TENSORFLOWGPU=true
PIPCMD="pip3"
JUPYTERCMD="jupyter"

sudo apt-get update -y
sudo apt install -y graphviz libgraphviz-dev  # graphviz is needed for keras.utils.vis_model.plot_model
sudo apt install -y freetds-dev   # for pymssql
sudo apt install -y python3-tk    # module named 'tkinter'

pyenv install -v ${PYTHONVERSION} --skip-existing
pyenv global ${PYTHONVERSION}
pyenv rehash

####  If there are root owner files under ~/.local, pip command probably does not work.
if [ ! -d ${HOME}/.local ]; then
    mkdir ${HOME}/.local
fi
sudo chown -R ${USER} ${HOME}/.local

###------------------------------------------------------------
### PyPI (Python package index)
###------------------------------------------------------------
#set +e
#sudo pip uninstall -y setuptools
#set -e
#${PIPCMD} install --user --upgrade setuptools
${PIPCMD} install --user --upgrade numpy
${PIPCMD} install --user --upgrade scipy
${PIPCMD} install --user --upgrade cython
${PIPCMD} install --user --upgrade scikit-learn
${PIPCMD} install --user --upgrade scikit-image 
${PIPCMD} install --user --upgrade pandas
${PIPCMD} install --user --upgrade seaborn
${PIPCMD} install --user --upgrade jupyter
${PIPCMD} install --user --upgrade opencv-python
${PIPCMD} install --user --upgrade opencv-contrib-python
${PIPCMD} install --user --upgrade pydot
${PIPCMD} install --user --upgrade graphviz
${PIPCMD} install --user --upgrade jedi  # auto-completion
${PIPCMD} install --user --upgrade "dask[complete]"
${PIPCMD} install --user --upgrade ray
${PIPCMD} install --user --upgrade cookiecutter  # https://qiita.com/Hironsan/items/4479bdb13458249347a1

####------------------------------------------------------------
####  TensorFlow / Keras
####------------------------------------------------------------
####    - https://www.tensorflow.org/install/
####  - tensorflow
####  - tensorflow-gpu
####  - https://github.com/bstriner/keras-tqdm
if [ "$TENSORFLOWGPU" = true ]; then
    ${PIPCMD} install --user --upgrade tensorflow-gpu
else
    ${PIPCMD} install --user --upgrade tensorflow
fi
${PIPCMD} install --user --upgrade keras
${PIPCMD} install --user --upgrade keras-tqdm

#####----------------------------------------
####  Chainer / cupy
${PIPCMD} install --user --upgrade cupy
${PIPCMD} install --user --upgrade chainer

####------------------------------------------------------------
####  SQL
####------------------------------------------------------------
####    - MySQL
####    - PostgreSQL
####      - https://pypi.org/project/pgspecial/
${PIPCMD} install --user --upgrade ipython-sql  # sql
${PIPCMD} install --user --upgrade psycopg2
${PIPCMD} install --user --upgrade pgspecial    # for posgresql : https://pypi.org/project/pgspecial/

####------------------------------------------------------------
####  for NeoVim
####------------------------------------------------------------
${PIPCMD} install --user --upgrade neovim

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


