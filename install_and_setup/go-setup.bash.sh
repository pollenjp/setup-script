#!/bin/bash -eux

filename=go1.17.1.linux-amd64.tar.gz
filepath=~/${filename}

if [[ -d "${filepath}" ]]; then
    exit 1
fi
if [[ ! -e "${filepath}" ]]; then
    wget https://golang.org/dl/${filename} --output-file=${filepath}
fi

sudo rm -rf /usr/local/go 
sudo tar -C /usr/local -xzf ${filepath}
sudo rm -rf ${filepath}

setup_for_go () {
    local config_file=$1
    echo 'export PATH=/usr/local/go/bin:$PATH'    >> ${config_file}
    echo 'export PATH=$(go env GOPATH)/bin:$PATH' >> ${config_file}
}
setup_for_go ~/.profile
setup_for_go ~/.zprofile
