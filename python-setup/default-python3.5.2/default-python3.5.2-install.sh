#!/usr/bin/zsh -eu

########################################
#  Parameter
#    - https://unix.stackexchange.com/questions/129391/passing-named-arguments-to-shell-scripts
#    - https://stackoverflow.com/a/14203146/9316234
GPU_USE=true  # true or not
PIPCMD=~/.local/bin/pip3
JUPYTERCMD=~/.local/bin/jupyter
########################################


source ${HOME}/.zshrc

##  Python3
sudo apt update -y 
sudo apt upgrade -y 
sudo apt install -y python3
sudo apt install -y python3-dev
sudo apt install -y python3-pip
pip3 install --user --upgrade pip

##  install apt packages for some pip pacakges
sudo apt install -y graphviz libgraphviz-dev  # graphviz is needed for keras.utils.vis_model.plot_model
sudo apt install -y freetds-dev   # for pymssql
sudo apt install -y python3-tk    # module named 'tkinter'
sudo apt install -y ffmpeg        # ffmpeg-python - PyPI

##  If there are root owner files under ~/.local, pip command probably does not work.
if [ ! -d ${HOME}/.local ]; then
    mkdir ${HOME}/.local
fi
sudo chown -R ${USER} ${HOME}/.local

###------------------------------------------------------------
### PyPI (Python package index)
###------------------------------------------------------------
#set +e
#sudo ${PIPCMD} uninstall -y setuptools
#sudo ${PIPCMD} uninstall -y wheel
#set -e
${PIPCMD} install --user --upgrade setuptools
#${PIPCMD} install --user --upgrade wheel
${PIPCMD} install --user --upgrade numpy
${PIPCMD} install --user --upgrade scipy
${PIPCMD} install --user --upgrade cython
${PIPCMD} install --user --upgrade scikit-learn
${PIPCMD} install --user --upgrade scikit-image 
${PIPCMD} install --user --upgrade pandas
${PIPCMD} install --user --upgrade seaborn
${PIPCMD} install --user --upgrade jupyter
${PIPCMD} install --user --upgrade opencv-python
${PIPCMD} install --user --upgrade tifffile
${PIPCMD} install --user --upgrade pydot
${PIPCMD} install --user --upgrade graphviz
${PIPCMD} install --user --upgrade jedi  # auto-completion
${PIPCMD} install --user --upgrade "dask[complete]"
${PIPCMD} install --user --upgrade ray
${PIPCMD} install --user --upgrade cookiecutter  # https://qiita.com/Hironsan/items/4479bdb13458249347a1
${PIPCMD} install --user --upgrade py4j
${PIPCMD} install --user --upgrade gym
${PIPCMD} install --user --upgrade ffmpeg-python  # https://pypi.org/project/ffmpeg-python/
${PIPCMD} install --user --upgrade JSAnimation
${PIPCMD} install --user --upgrade torch torchvision
${PIPCMD} install --user --upgrade imageio    #https://pypi.org/project/imageio/


####------------------------------------------------------------
####  TensorFlow / Keras
####------------------------------------------------------------
####    - https://www.tensorflow.org/install/
####  - tensorflow
####  - tensorflow-gpu
####  - https://github.com/bstriner/keras-tqdm
if [ ${GPU} = true ]; then
    ${PIPCMD} install --user --upgrade tensorflow-gpu
else
    ${PIPCMD} install --user --upgrade tensorflow
fi
${PIPCMD} install --user --upgrade keras
${PIPCMD} install --user --upgrade keras-tqdm

####----------------------------------------
####  Chainer / cupy
####----------------------------------------
if [ ${GPU} = true ]; then
    ${PIPCMD} install --user --upgrade cupy
fi
${PIPCMD} install --user --upgrade chainer
#${PIPCMD} install --user --upgrade chainermn

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


##--------------------------------------------------------------------------------
##  Python2
##--------------------------------------------------------------------------------
sudo apt update -y 
sudo apt upgrade -y 
sudo apt install -y python
sudo apt install -y python-dev
sudo apt install -y python-pip

