#!/bin/bash -eux

#!/usr/bin/zsh -eux
#source ~/.zshrc

PYTHONVERSION="anaconda3-4.2.0"
CONDA_ENV_NAME="py3.5.2"
GPU=true
PIPCMD="pip"
JUPYTERCMD="jupyter"

pyenv local --unset
pyenv install -v ${PYTHONVERSION} --skip-existing
pyenv global system             # 謎だが一度出てから入るとcondaコマンドがうまく認識される
pyenv global ${PYTHONVERSION}
pyenv rehash
set +e
eval "$(pyenv virtualenv-init -)"
set -e
which conda
conda info -e
conda update conda

#  If there are root owner files under ~/.local, pip command probably does not work.
if [ ! -d ${HOME}/.local ]; then
    mkdir ${HOME}/.local
fi
sudo chown -R ${USER} ${HOME}/.local

####################################################################################################
#  CONDA
########################################
conda install -y -c anaconda    numpy
conda install -y -c anaconda    setuptools=39.1.0 # tensorflow-gpu 1.11.0 has requirement setuptools<=39.1.0,
                                                  # but you'll have setuptools 40.5.0 which is incompatible.
conda install -y -c menpo       opencv3
conda install -y -c conda-forge wheel
conda install -y -c conda-forge tqdm
conda install -y -c conda-forge scipy
conda install -y -c conda-forge cython
conda install -y -c conda-forge pandas
conda install -y -c conda-forge seaborn
conda install -y -c conda-forge scikit-learn
conda install -y -c conda-forge scikit-image 
conda install -y -c conda-forge jupyter
conda install -y -c conda-forge jupyter_contrib_nbextensions
####################
#    - TensorFlow / Keras
#       - https://www.tensorflow.org/install/
#       - tensorflow
#       - tensorflow-gpu
#       - https://github.com/bstriner/keras-tqdm
if [ "${GPU}" = true ]; then
    conda install -y -c anaconda tensorflow-gpu
    conda install -y -c anaconda keras-gpu 
else
    conda install -y -c conda-forge tensorflow 
    conda install -y -c conda-forge keras 
fi
####################
#    - Chainer / cupy
conda install -y -c anaconda cupy
conda install -y -c anaconda chainer

########################################
#  ANACONDA ENV
set +e
conda create --name "${CONDA_ENV_NAME}" python=3.5.2
set -e
pyenv local "${PYTHONVERSION}/envs/${CONDA_ENV_NAME}"
conda activate ${CONDA_ENV_NAME}

####################################################################################################
### PyPI (Python package index)
###------------------------------------------------------------
#set +e
#sudo ${PIPCMD} uninstall -y setuptools
#sudo ${PIPCMD} uninstall -y wheel
#set -e
${PIPCMD} install --user --upgrade keras-tqdm
#${PIPCMD} install --user --upgrade wheel
#${PIPCMD} install --user --upgrade tifffile
#${PIPCMD} install --user --upgrade pydot
#${PIPCMD} install --user --upgrade graphviz
#${PIPCMD} install --user --upgrade jedi  # auto-completion
#${PIPCMD} install --user --upgrade "dask[complete]"
#${PIPCMD} install --user --upgrade ray
#${PIPCMD} install --user --upgrade cookiecutter  # https://qiita.com/Hironsan/items/4479bdb13458249347a1
#${PIPCMD} install --user --upgrade py4j
#${PIPCMD} install --user --upgrade gym
#${PIPCMD} install --user --upgrade ffmpeg-python  # https://pypi.org/project/ffmpeg-python/
#${PIPCMD} install --user --upgrade JSAnimation
#${PIPCMD} install --user --upgrade torch torchvision


#####------------------------------
#####  setting
#####------------------------------
#####    - https://github.com/ipython-contrib/jupyter_contrib_nbextensions
${JUPYTERCMD} contrib nbextension install --user

conda deactivate

