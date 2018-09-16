#!/bin/bash -eux


sudo apt remove cmake
chmod +x cmake-3.7.2-Linux-x86_64.sh
sudo ./cmake-3.7.2-Linux-x86_64.sh
sudo mv cmake-3.7.2-Linux-x86_64 /opt
sudo ln -s /opt/cmake-3.7.2-Linux-x86_64/bin/* /usr/local/bin

