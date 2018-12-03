#!/bin/bash -xeu

# https://www.virtualbox.org/wiki/Linux_Downloads

# replace '<mydist>' with 'artful', 'zesty', 'yakkety', 'xenial'(16.04), 'trusty', 'stretch', 'jessie', or 'wheezy' 
echo "deb https://download.virtualbox.org/virtualbox/debian xenial contrib" | sudo tee -a /etc/apt/sources.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -

sudo apt-get update -y && sudo apt-get install -y virtualbox-5.2


