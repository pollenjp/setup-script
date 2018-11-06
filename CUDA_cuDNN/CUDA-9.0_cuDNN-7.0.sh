#!/bin/bash -eux

# CUDA-9.0_cuDNN-7.0.sh
sudo apt update -y

CWD=$(pwd)
SOURCEDIR=${CWD}/"source-dir"
if [ ! -f ${SOURCEDIR} ]; then
    echo "create ${SOURCEDIR}"
fi

#--------------------------------------------------------------------------------
#  Install CUDA-9.0
#--------------------------------------------------------------------------------
CWD=$(pwd)
DEB_REPO="${SOURCEDIR}/cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb"
if [ ! -f "${DEB_REPO}" ]; then
    echo "File not found!"
    wget "https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda-repo-ubuntu1604-9-0-local_9.0.176-1_amd64-deb" \
	    --directory-prefix=${SOURCEDIR}
fi
sudo dpkg -i "${DEB_REPO}"
sudo apt-key add /var/cuda-repo-9-0-local/7fa2af80.pub
sudo apt-get update -y
sudo apt-get install -y cuda-9-0


#--------------------------------------------------------------------------------
#  Install cuDNN-7.0
#--------------------------------------------------------------------------------
#  Download
#    - [cuDNN Download | NVIDIA Developer](https://developer.nvidia.com/rdp/cudnn-download)
#  You should run command by this order
#    - cuDNN v7.3.1 Runtime Library for Ubuntu16.04 (Deb)             (libcudnn7-dev_7.3.1.20-1+cuda9.0_amd64.deb)
#    - cuDNN v7.3.1 Developer Library for Ubuntu16.04 (Deb)           (libcudnn7-doc_7.3.1.20-1+cuda9.0_amd64.deb)
#    - cuDNN v7.3.1 Code Samples and User Guide for Ubuntu16.04 (Deb) (libcudnn7_7.3.1.20-1+cuda9.0_amd64.deb)



FILE_LIST = (\
  "${SOURCEDIR}/libcudnn7_7.3.1.20-1+cuda9.0_amd64.deb" \
  "${SOURCEDIR}/libcudnn7-dev_7.3.1.20-1+cuda9.0_amd64.deb" \
  "${SOURCEDIR}/libcudnn7-doc_7.3.1.20-1+cuda9.0_amd64.deb" \
)
for FILENAME in "${FILE_LIST[@]}"; do
  if [ -f ${FILENAME} ]; then
      sudo dpkg -i ${FILENAME}
  else
      echo "file ${FILENAME} does not exists!"
      exit 1
  fi
done


#--------------------------------------------------------------------------------
#  PATH
#--------------------------------------------------------------------------------
#  add export command path
#  shell file
#    - .bashrc
RC_FILE=~/.bashrc
echo -e "## CUDA and cuDNN paths"  >> ${RC_FILE}
echo 'export PATH=/usr/local/cuda-9.0/bin:${PATH}' >> ${rc_file}
echo 'export ld_library_path=/usr/local/cuda-9.0/lib64:${ld_library_path}' >> ${rc_file}
source ${RC_FILE}
#    - .zshrc
RC_FILE=~/.zshrc
echo -e "## CUDA and cuDNN paths"  >> ${RC_FILE}
echo 'export PATH=/usr/local/cuda-9.0/bin:${PATH}' >> ${rc_file}
echo 'export ld_library_path=/usr/local/cuda-9.0/lib64:${ld_library_path}' >> ${rc_file}
source ${RC_FILE}

