#!/usr/bin/zsh -eux
# zshで実行する必要がある。
source ${HOME}/.zshrc

TENSORFLOWGPU=true
PIPCMD=pip3

# TODO
##  Python3
#sudo apt update -y 
#sudo apt upgrade -y 
#sudo apt install -y python3
#sudo apt install -y python3-dev
#sudo apt install -y python3-pip
pip3 install --upgrade pip

##  install apt packages for some pip pacakges
sudo apt install -y graphviz libgraphviz-dev  # graphviz is needed for keras.utils.vis_model.plot_model
sudo apt install -y freetds-dev   # for pymssql
sudo apt install -y python3-tk    # module named 'tkinter'
sudo apt install -y ffmpeg        # ffmpeg-python - PyPI

###  If there are root owner files under ~/.local, pip command probably does not work.
#if [ ! -d ${HOME}/.local ]; then
#    mkdir ${HOME}/.local
#fi
#sudo chown -R ${USER} ${HOME}/.local

###------------------------------------------------------------
### PyPI (Python package index)
###------------------------------------------------------------
#set +e
#sudo ${PIPCMD} uninstall -y setuptools
#sudo ${PIPCMD} uninstall -y wheel
#set -e
${PIPCMD} install --upgrade setuptools
#${PIPCMD} install --upgrade wheel
${PIPCMD} install --upgrade numpy
${PIPCMD} install --upgrade scipy
${PIPCMD} install --upgrade cython
${PIPCMD} install --upgrade scikit-learn
${PIPCMD} install --upgrade scikit-image 
${PIPCMD} install --upgrade pandas
${PIPCMD} install --upgrade seaborn
${PIPCMD} install --upgrade jupyter
${PIPCMD} install --upgrade opencv-python
${PIPCMD} install --upgrade tifffile
${PIPCMD} install --upgrade pydot
${PIPCMD} install --upgrade graphviz
${PIPCMD} install --upgrade jedi  # auto-completion
${PIPCMD} install --upgrade "dask[complete]"
${PIPCMD} install --upgrade ray
${PIPCMD} install --upgrade cookiecutter  # https://qiita.com/Hironsan/items/4479bdb13458249347a1
${PIPCMD} install --upgrade py4j
${PIPCMD} install --upgrade gym
${PIPCMD} install --upgrade ffmpeg-python  # https://pypi.org/project/ffmpeg-python/
${PIPCMD} install --upgrade JSAnimation
${PIPCMD} install --upgrade torch torchvision
${PIPCMD} install --upgrade imageio    #https://pypi.org/project/imageio/



####------------------------------------------------------------
####  TensorFlow / Keras
####------------------------------------------------------------
####    - https://www.tensorflow.org/install/
####  - tensorflow
####  - tensorflow-gpu
####  - https://github.com/bstriner/keras-tqdm
if [ "$TENSORFLOWGPU" = true ]; then
    ${PIPCMD} install --upgrade tensorflow-gpu
else
    ${PIPCMD} install --upgrade tensorflow
fi
${PIPCMD} install --upgrade keras
${PIPCMD} install --upgrade keras-tqdm

####----------------------------------------
####  Chainer / cupy
####----------------------------------------
${PIPCMD} install --upgrade cupy
${PIPCMD} install --upgrade chainer
#${PIPCMD} install --upgrade chainermn


####------------------------------------------------------------
####  for NeoVim
####------------------------------------------------------------
${PIPCMD} install --upgrade neovim

