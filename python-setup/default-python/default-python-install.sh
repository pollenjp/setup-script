#!/usr/bin/zsh -eu

########################################
#  Parameter
#    - https://unix.stackexchange.com/questions/129391/passing-named-arguments-to-shell-scripts
#    - https://stackoverflow.com/a/14203146/9316234
#GPU=true  # true or not (this should be commented out.)
PIPCMD=~/.local/bin/pip3
JUPYTERCMD=~/.local/bin/jupyter
SYSTEM_PIPCMD=/usr/bin/pip3
########################################

##  Python3
sudo apt update -y 
sudo apt upgrade -y 
sudo apt install -y python3
sudo apt install -y python3-dev
sudo apt install -y python3-pip
if [ -f ${PIPCMD} ]; then
    ${PIPCMD} install --user --upgrade pip
else
    ${SYSTEM_PIPCMD} install --user --upgrade pip
fi

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
${PIPCMD} install --user --upgrade tifffile
${PIPCMD} install --user --upgrade pydot
${PIPCMD} install --user --upgrade graphviz
${PIPCMD} install --user --upgrade jedi  # auto-completion
${PIPCMD} install --user --upgrade "dask[complete]"
${PIPCMD} install --user --upgrade ffmpeg-python  # https://pypi.org/project/ffmpeg-python/
${PIPCMD} install --user --upgrade JSAnimation
${PIPCMD} install --user --upgrade imageio    #https://pypi.org/project/imageio/


####------------------------------------------------------------
####  for NeoVim
####------------------------------------------------------------
${PIPCMD} install --user --upgrade neovim

##--------------------------------------------------------------------------------
##  Python2
##--------------------------------------------------------------------------------
# sudo apt update -y 
# sudo apt upgrade -y 
# sudo apt install -y python
# sudo apt install -y python-dev
# sudo apt install -y python-pip
