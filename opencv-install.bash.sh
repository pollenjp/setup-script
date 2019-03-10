#!/bin/bash -eux
#OPENCV_VERSION=4.0.0
#NOTCLEAN  # flag : buildディレクトリルが存在していればそれを使う
OPENCV_DIR=${HOME}/.opencv
CMAKE_INSTALL_PREFIX=${OPENCV_DIR}/install/OpenCV-${OPENCV_VERSION}
# current working directory
CWD=$(pwd)

# [Install OpenCV 4 on Ubuntu 16.04 (C++ and Python) | Learn OpenCV](https://www.learnopencv.com/install-opencv-4-on-ubuntu-16-04/)
# [memo on hackmd.io](https://hackmd.io/MVHtNQarSouT_b9H9yAa_w)

#=======================================
## Install dependencies
sudo apt -y install build-essential checkinstall cmake pkg-config yasm \
                    git gfortran \
                    libjpeg8-dev libjasper-dev libpng12-dev \
                    libtiff5-dev \
                    libtiff-dev \
                    libavcodec-dev libavformat-dev libswscale-dev libdc1394-22-dev \
                    libxine2-dev libv4l-dev \
                    libgstreamer0.10-dev libgstreamer-plugins-base0.10-dev \
                    libgtk2.0-dev libtbb-dev qt5-default \
                    libatlas-base-dev \
                    libfaac-dev libmp3lame-dev libtheora-dev \
                    libvorbis-dev libxvidcore-dev \
                    libopencore-amrnb-dev libopencore-amrwb-dev \
                    libavresample-dev \
                    x264 v4l-utils
# Optional dependencies
sudo apt -y install libprotobuf-dev protobuf-compiler
sudo apt -y install libgoogle-glog-dev libgflags-dev
sudo apt -y install libgphoto2-dev libeigen3-dev libhdf5-dev doxygen


#=======================================
if [ ! -d ${OPENCV_DIR} ]; then
  mkdir ${OPENCV_DIR}
fi
cd ${directory1}

#=======================================
#===================
# opencv
directory1=
if [ ! -d "${OPENCV_DIR}/opencv" ]; then
  git clone https://github.com/opencv/opencv.git
fi

cd "${OPENCV_DIR}/opencv"
git checkout ${OPENCV_VERSION}
cd ..
 
#===================
# opencv_contrib
if [ ! -d "${OPENCV_DIR}/opencv_contrib" ]; then
  git clone https://github.com/opencv/opencv_contrib.git
fi
cd "${OPENCV_DIR}/opencv_contrib"
git checkout ${OPENCV_VERSION}
cd ..


#=======================================
cd "${OPENCV_DIR}/opencv"
directory1=build
if [ -d "${directory1}" ] && [ -z ${NOTCLEAN+x} ]; then
  # ${NOTCLEAN} is unset
  rm -rf ${directory1}
  mkdir ${directory1}
fi
if [ ! -d "${directory1}" ]; then
  mkdir ${directory1}
fi
cd build
cmake -D CMAKE_BUILD_TYPE=RELEASE \
      -D CMAKE_INSTALL_PREFIX=${CMAKE_INSTALL_PREFIX} \
      -D INSTALL_C_EXAMPLES=ON \
      -D WITH_TBB=ON \
      -D WITH_V4L=ON \
      -D WITH_QT=ON \
      -D WITH_OPENGL=ON \
      -D OPENCV_EXTRA_MODULES_PATH=../../opencv_contrib/modules \
      -D BUILD_EXAMPLES=ON \
      ..
      #-D INSTALL_PYTHON_EXAMPLES=ON \
      #-D OPENCV_PYTHON3_INSTALL_PATH=$cwd/OpenCV-$cvVersion-py3/lib/python3.5/site-packages \
make -j4
make install

#===============================================================================
#  Back to working directory
cd ${CWD}
