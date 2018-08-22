#!/bin/bash -eux

# Ubuntu16.04
# pip install -r requirements.txt
# https://www.lifewithpython.com/2014/03/python-install-multiple-modules-.html

#----------------------------------------------------------------------------------------------------
#  CHOISE
#----------------------------------------------------------------------------------------------------
TENSORFLOWGPU=false


#----------------------------------------------------------------------------------------------------
# Python
##--------------------------------------------------------------------------------
##  Python3
###------------------------------------------------------------
###  Python PyPI
###------------------------------------------------------------
sudo apt install -y python3
sudo apt install -y python3-pip

###------------------------------------------------------------
### PyPI (Python package index)
###------------------------------------------------------------
sudo pip3 install -U pip
sudo pip3 install -U numpy
sudo pip3 install -U scipy
sudo pip3 install -U cython
sudo pip3 install -U scikit-learn
sudo pip3 install -U pandas
sudo pip3 install -U seaborn
sudo pip3 install -U jupyter
sudo pip3 install -U opencv-python
sudo pip3 install -U pydot
sudo pip3 install -U graphviz
sudo pip3 install -U jedi             # auto-completion
sudo pip3 install -U "dask[complete]"
sudo pip3 install -U ray

sudo pip3 install -U cookiecutter     # https://qiita.com/Hironsan/items/4479bdb13458249347a1

####------------------------------------------------------------
####  TensorFlow / Keras
####------------------------------------------------------------
####    - https://www.tensorflow.org/install/
####  - tensorflow
####  - tensorflow-gpu
####  - https://github.com/bstriner/keras-tqdm
if [ "$TENSORFLOWGPU" = true ]; then
    sudo pip3 install -U tensorflow-gpu
else
    sudo pip3 install -U tensorflow
fi
sudo pip3 install -U keras
sudo pip3 install -U keras-tqdm
#####----------------------------------------
#####  graphviz is needed for keras.utils.vis_model.plot_model
sudo apt install -y graphviz libgraphviz-dev

####------------------------------------------------------------
####  SQL
####------------------------------------------------------------
####    - MySQL
####    - PostgreSQL
####      - https://pypi.org/project/pgspecial/
sudo pip3 install -U ipython-sql  # sql
sudo pip3 install -U psycopg2
sudo pip3 install -U pgspecial    # for posgresql : https://pypi.org/project/pgspecial/
sudo apt install freetds-dev -y   # for pymssql
sudo apt install python3-tk -y    # module named 'tkinter'

####------------------------------------------------------------
####  for NeoVim
####------------------------------------------------------------
sudo pip3 install -U neovim

####------------------------------------------------------------
####  Jupyter
####------------------------------------------------------------
sudo pip3 install -U jupyter_contrib_nbextensions
sudo pip3 install -U ipython-sql
#####------------------------------
#####  setting
#####------------------------------
#####    - https://github.com/ipython-contrib/jupyter_contrib_nbextensions
jupyter contrib nbextension install --user

#####------------------------------
#####  Extensions
#####------------------------------
jupyter nbextension enable python-markdown/main  # MarkdownセルでPythonの変数を表示可能
jupyter nbextension enable toc2/main             # TableOfContents
######--------------------
######  jupyter-vim-binding
######--------------------
CWD=$(pwd)
if [! -f $(jupyter --data-dir)/nbextensions ]; then
    mkdir -p $(jupyter --data-dir)/nbextensions
fi
cd $(jupyter --data-dir)/nbextensions
if [ ! -f jupyter-vim-binding vim_binding ]; then
    git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
fi
jupyter nbextension enable vim_binding/vim_binding
cd $(CWD)

####----------------------------------------
####   Run Google Colaboratory on local runtime
####----------------------------------------
sudo pip3 install jupyter_http_over_ws
jupyter serverextension enable --py jupyter_http_over_ws


##--------------------------------------------------------------------------------
##  Python2
##--------------------------------------------------------------------------------
sudo apt install -y python
sudo apt install -y python-pip
