#!/bin/bash -eux

go_install_path=${HOME}/.local_go
mkdir -p ${go_install_path}
tar_gz_filename=go1.17.1.linux-amd64.tar.gz
mkdir -p ${go_install_path}/archive
tar_gz_filepath=${go_install_path}/archive/${tar_gz_filename}

if [[ -d "${tar_gz_filepath}" ]]; then
    exit 1
fi
if [[ ! -e "${tar_gz_filepath}" ]]; then
    wget -C https://golang.org/dl/${tar_gz_filename} -O ${tar_gz_filepath}
fi

rm -rf ${go_install_path}
tar -zxvf ${tar_gz_filepath} -C ${go_install_path}
rm -rf ${tar_gz_filepath}

setup_for_go () {
    local config_file=$1
    echo 'export PATH='${go_install_path}/go/bin':$PATH'    >> ${config_file}
    echo 'export PATH=$(go env GOPATH)/bin:$PATH' >> ${config_file}
}
setup_for_go ${HOME}/.profile
setup_for_go ${HOME}/.zprofile
