# Ubuntu16.04
# pip install -r requirements.txt
# https://www.lifewithpython.com/2014/03/python-install-multiple-modules-.html
apt update -y
apt upgrade -y
# install pip
apt install python-pip
apt install python3-pip

# python2
apt install python  -y                          # install python
#apt install python-pip python-dev -y            # install pi3
#apt install libopencv-dev python-opencv -y      # install opencv
apt build-dep python-matplotlib -y              # install matplotlib

pip install --upgrade pip
pip install numpy
pip install scipy
pip install -U scikit-learn
pip install pandas
pip install seaborn
pip install jupyter
pip install jupyter_contrib_nbextensions
pip install tensorflow                          # install tensorflow (no GPU)
pip install keras
pip install opencv-python                       # opencv
pip install cookiecutter                        # https://qiita.com/Hironsan/items/4479bdb13458249347a1
pip install jedi                                # auto-completion
pip install pydot
pip install graphviz

# python3
apt install python3 -y                          # install python3
#apt install python3-pip python3-dev -y          # install pi3
#apt install libopencv-dev python3-opencv -y     # install opencv
#apt build-dep python3-matplotlib -y             # install matplotlib

pip3 install --upgrade pip
pip3 install numpy
pip3 install scipy
pip3 install -U scikit-learn
pip3 install pandas
pip3 install seaborn
pip3 install jupyter
pip3 install jupyter_contrib_nbextensions       # jupyter-extenxion
pip3 install ipython-sql                        # jupyter-extenxion
pip3 install memory_profiler
pip3 install tensorflow
pip3 install keras
pip3 install opencv-python                      # opencv
pip3 install cookiecutter                       # https://qiita.com/Hironsan/items/4479bdb13458249347a1
pip3 install jedi                               # auto-completion
pip3 install pydot
pip3 install graphviz
pip install -U memory_profiler                  # for check memory

    # for pandas
pip3 install "dask[complete]"                   # Install everything
pip3 install ray
# sql
pip3 install pymysql
pip3 install pymssql
apt install freetds-dev                         # for pymssql

# for Neovim
pip3 install neovim


# jupyter setting
jupyter contrib nbextension install --user

# graphviz is needed for keras.utils.vis_model.plot_model
apt install -y graphviz libgraphviz-dev
