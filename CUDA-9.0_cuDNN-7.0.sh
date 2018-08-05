#!/bin/bash -eux

# CUDA-9.0_cuDNN-7.0.sh


#--------------------------------------------------------------------------------
#  Install CUDA-9.0
#--------------------------------------------------------------------------------
CWD=$(pwd)
deb_repo="cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb"
echo "${CWD}/${deb_repo}"
if [ ! -f ${CWD}/${deb_repo} ]; then
    echo "File not found!"
    wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb
fi
sudo dpkg -i "${CWD}/${deb_repo}"
sudo apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub
sudo apt-get update
sudo apt-get install -y cuda-9-0


#--------------------------------------------------------------------------------
#  Install cuDNN-7.0
#--------------------------------------------------------------------------------
#  Download
#    - https://developer.nvidia.com/rdp/cudnn-download
#  You should run command by this order
#    - cuDNN v7.0.5 Runtime Library for Ubuntu16.04 (Deb)
#    - cuDNN v7.0.5 Developer Library for Ubuntu16.04 (Deb)
#    - cuDNN v7.0.5 Code Samples and User Guide for Ubuntu16.04 (Deb)
sudo dpkg -i libcudnn7_7.0.5.15-1+cuda9.0_amd64.deb 
sudo dpkg -i libcudnn7-dev_7.0.5.15-1+cuda9.0_amd64.deb
sudo dpkg -i libcudnn7-doc_7.0.5.15-1+cuda9.0_amd64.deb


#--------------------------------------------------------------------------------
#  PATH
#--------------------------------------------------------------------------------
#  add export command path
#  shell file
#    - .bashrc
echo -e "## CUDA and cuDNN paths"  >> ~/.bashrc
echo 'export PATH=/usr/local/cuda-9.0/bin:${PATH}' >> ~/.bashrc
echo 'export LD_LIBRARY_PATH=/usr/local/cuda-9.0/lib64:${LD_LIBRARY_PATH}' >> ~/.bashrc

