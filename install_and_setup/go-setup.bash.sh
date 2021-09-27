#!/bin/bash -eux

filename=go1.17.1.linux-amd64.tar.gz
filepath=${HOME}/${filename}

if [[ -d "${filepath}" ]]; then
    exit 1
fi
if [[ ! -e "${filepath}" ]]; then
    wget -C https://golang.org/dl/${filename} -O ${filepath}
fi

sudo rm -rf /usr/local/go
sudo tar -zxvf ${filepath} -C /usr/local
sudo rm -rf ${filepath}

setup_for_go () {
    local config_file=$1
    echo 'export PATH=/usr/local/go/bin:$PATH'    >> ${config_file}
    echo 'export PATH=$(go env GOPATH)/bin:$PATH' >> ${config_file}
}
setup_for_go ${HOME}/.profile
setup_for_go ${HOME}/.zprofile
