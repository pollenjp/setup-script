#!/bin/bash -eux


SOURCEDIR="./source-dir"

#--------------------------------------------------------------------------------
#  Install cuDNN-7.0
#--------------------------------------------------------------------------------
#  Download
#    - [cuDNN Download | NVIDIA Developer](https://developer.nvidia.com/rdp/cudnn-download)
#  You should run command by this order
#    - cuDNN v7.0.5 Runtime Library for Ubuntu16.04 (Deb)
#    - cuDNN v7.0.5 Developer Library for Ubuntu16.04 (Deb)
#    - cuDNN v7.0.5 Code Samples and User Guide for Ubuntu16.04 (Deb)
FILE_LIST=(\
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


