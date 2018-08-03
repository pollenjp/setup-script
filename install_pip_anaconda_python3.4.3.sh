# Anaconda3
# pip install -r requirements.txt
# https://www.lifewithpython.com/2014/03/python-install-multiple-modules-.html

# python3.4.3
pip install --upgrade pip

pip install -U pip
pip install -U numpy
pip install -U scipy
pip install -U cython
pip install -U scikit-learn
pip install -U pandas
pip install -U seaborn
pip install -U jupyter
pip install -U jupyter_contrib_nbextensions       # jupyter-extenxion
pip install -U ipython-sql                        # jupyter-extenxion
pip install -U memory_profiler
pip install -U tensorflow
pip install -U keras
pip install -U opencv-python                      # opencv
pip install -U cookiecutter                       # https://qiita.com/Hironsan/items/4479bdb13458249347a1
pip install -U jedi                               # auto-completion
pip install -U pydot
pip install -U graphviz
pip install -U memory_profiler                  # for check memory

# sql
pip install ipython-sql                           # sql
pip install -U pymysql
pip install -U pymssql
pip install psycopg2
pip install pgspecial                             # for posgresql : https://pypi.org/project/pgspecial/

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

#------------------------------------------------------------
#   Run Google Colaboratory on local runtime
#------------------------------------------------------------
sudo pip3 install jupyter_http_over_ws
jupyter serverextension enable --py jupyter_http_over_ws


# graphviz is needed for keras.utils.vis_model.plot_model
sudo apt install -y graphviz libgraphviz-dev
