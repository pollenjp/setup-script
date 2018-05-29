# Ubuntu16.04
# pip install -r requirements.txt
# https://www.lifewithpython.com/2014/03/python-install-multiple-modules-.html
sudo apt update -y
sudo apt upgrade -y
# install pip
sudo apt install python-pip -y
sudo apt install python3-pip -y

# python2
sudo apt install python  -y                          # install python
#apt install python-pip python-dev -y            # install pi3
#apt install libopencv-dev python-opencv -y      # install opencv
sudo apt build-dep python-matplotlib -y              # install matplotlib
sudo 
sudo pip install --upgrade pip
sudo pip install numpy
sudo pip install scipy
sudo pip install -U scikit-learn
sudo pip install pandas
sudo pip install seaborn
sudo pip install jupyter
sudo pip install jupyter_contrib_nbextensions
sudo pip install tensorflow                          # install tensorflow (no GPU)
sudo pip install keras
sudo pip install opencv-python                       # opencv
sudo pip install cookiecutter                        # https://qiita.com/Hironsan/items/4479bdb13458249347a1
sudo pip install jedi                                # auto-completion
sudo pip install pydot
sudo pip install graphviz

# python3
sudo apt install python3 -y                          # install python3
#apt install python3-pip python3-dev -y          # install pi3
#apt install libopencv-dev python3-opencv -y     # install opencv
#apt build-dep python3-matplotlib -y             # install matplotlib

sudo pip3 install -U pip
sudo pip3 install -U numpy
sudo pip3 install -U scipy
sudo pip3 install -U scikit-learn
sudo pip3 install -U pandas
sudo pip3 install -U seaborn
sudo pip3 install -U jupyter
sudo pip3 install -U jupyter_contrib_nbextensions       # jupyter-extenxion
sudo pip3 install -U ipython-sql                        # jupyter-extenxion
sudo pip3 install -U memory_profiler
sudo pip3 install -U tensorflow
sudo pip3 install -U keras
sudo pip3 install -U opencv-python                      # opencv
sudo pip3 install -U cookiecutter                       # https://qiita.com/Hironsan/items/4479bdb13458249347a1
sudo pip3 install -U jedi                               # auto-completion
sudo pip3 install -U pydot
sudo pip3 install -U graphviz
sudo pip3 install -U memory_profiler                  # for check memory

    # for pandas
sudo pip3 install -U "dask[complete]"                   # Install everything
sudo pip3 install -U ray
# sql
sudo pip3 install ipython-sql                           # sql
sudo pip3 install -U pymysql
sudo pip3 install -U pymssql
sudo pip3 install psycopg2
sudo pip3 install pgspecial                             # for posgresql : https://pypi.org/project/pgspecial/

sudo apt install freetds-dev -y                         # for pymssql
sudo apt install python3-tk -y                          # module named 'tkinter'

# for Neovim
sudo pip3 install -U neovim


# jupyter setting
# https://github.com/ipython-contrib/jupyter_contrib_nbextensions
jupyter contrib nbextension install --user

#----------------------------------------
#   jupyter-vim-binding
#----------------------------------------
mkdir -p $(jupyter --data-dir)/nbextensions
# Clone the repository
cd $(jupyter --data-dir)/nbextensions
git clone https://github.com/lambdalisue/jupyter-vim-binding vim_binding
# Activate the extension
jupyter nbextension enable vim_binding/vim_binding
cd ${HOME}



# graphviz is needed for keras.utils.vis_model.plot_model
sudo apt install -y graphviz libgraphviz-dev
