apt update -y
apt upgrade -y

apt install python3 -y                          # install python3
apt install python3-pip python3-dev -y          # install pi3
apt install libopencv-dev python3-opencv -y     # install opencv
apt build-dep python3-matplotlib -y             # install matplotlib

pip3 install --upgrade pip
pip3 install numpy                              # install numpy
pip3 install pandas                             # install pandas
pip3 install seaborn                            # install seaborn
pip3 install -U scikit-learn                    # install scikitlearn(sklearn)
pip3 install jupyter                            # install jupyter
pip3 install tensorflow                         # install tensorflow (no GPU)
pip3 install keras                              # install keras
