#!/bin/bash -eux
#  reference
#    - Writing Robust Bash Shell Scripts
#      - https://www.davidpashley.com/articles/writing-robust-shell-scripts/#id2382181

# Ubuntu16.04
# pip install -r requirements.txt
# https://www.lifewithpython.com/2014/03/python-install-multiple-modules-.html

#----------------------------------------------------------------------------------------------------
#  CHOISE
#----------------------------------------------------------------------------------------------------
TENSORFLOWGPU=true


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
set +e
sudo /usr/bin/pip3 uninstall -y setuptools
set -e
/usr/bin/pip3 install --user --upgrade setuptools
/usr/bin/pip3 install --user --upgrade wheel
/usr/bin/pip3 install --user --upgrade numpy
/usr/bin/pip3 install --user --upgrade scipy
/usr/bin/pip3 install --user --upgrade cython
/usr/bin/pip3 install --user --upgrade scikit-learn
/usr/bin/pip3 install --user --upgrade scikit-image 
/usr/bin/pip3 install --user --upgrade pandas
/usr/bin/pip3 install --user --upgrade seaborn
/usr/bin/pip3 install --user --upgrade jupyter
/usr/bin/pip3 install --user --upgrade opencv-python
/usr/bin/pip3 install --user --upgrade pydot
/usr/bin/pip3 install --user --upgrade graphviz
/usr/bin/pip3 install --user --upgrade jedi  # auto-completion
/usr/bin/pip3 install --user --upgrade "dask[complete]"
/usr/bin/pip3 install --user --upgrade ray
/usr/bin/pip3 install --user --upgrade cookiecutter  # https://qiita.com/Hironsan/items/4479bdb13458249347a1

####------------------------------------------------------------
####  TensorFlow / Keras
####------------------------------------------------------------
####    - https://www.tensorflow.org/install/
####  - tensorflow
####  - tensorflow-gpu
####  - https://github.com/bstriner/keras-tqdm
if [ "$TENSORFLOWGPU" = true ]; then
    /usr/bin/pip3 install --user --upgrade tensorflow-gpu
else
    /usr/bin/pip3 install --user --upgrade tensorflow
fi
/usr/bin/pip3 install --user --upgrade keras
/usr/bin/pip3 install --user --upgrade keras-tqdm
#####----------------------------------------
#####  graphviz is needed for keras.utils.vis_model.plot_model
sudo apt install -y graphviz libgraphviz-dev

####------------------------------------------------------------
####  SQL
####------------------------------------------------------------
####    - MySQL
####    - PostgreSQL
####      - https://pypi.org/project/pgspecial/
/usr/bin/pip3 install --user --upgrade ipython-sql  # sql
/usr/bin/pip3 install --user --upgrade psycopg2
/usr/bin/pip3 install --user --upgrade pgspecial    # for posgresql : https://pypi.org/project/pgspecial/
sudo apt install freetds-dev -y   # for pymssql
sudo apt install python3-tk -y    # module named 'tkinter'

####------------------------------------------------------------
####  for NeoVim
####------------------------------------------------------------
/usr/bin/pip3 install --user --upgrade neovim

####------------------------------------------------------------
####  Jupyter
####------------------------------------------------------------
/usr/bin/pip3 install --user --upgrade jupyter_contrib_nbextensions
/usr/bin/pip3 install --user --upgrade ipython-sql
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
cd ${CWD}

####----------------------------------------
####   Run Google Colaboratory on local runtime
####----------------------------------------
sudo /usr/bin/pip3 install --user --upgrade jupyter_http_over_ws
jupyter serverextension enable --py jupyter_http_over_ws


##--------------------------------------------------------------------------------
##  Python2
##--------------------------------------------------------------------------------
sudo apt install -y python
sudo apt install -y python-pip
