#!/bin/bash -eux
# checkshell shell=bash

go_download_url="$1"

go_install_path=${HOME}/.local_go
mkdir -p "${go_install_path}/archive"

tar_gz_filename="${go_download_url##*/}"
tar_gz_filepath="${go_install_path}/archive/${tar_gz_filename}"

if [[ -d "${tar_gz_filepath}" ]]; then
    exit 1
fi
if [[ ! -e "${tar_gz_filepath}" ]]; then
    wget -c "${go_download_url}" -O "${tar_gz_filepath}"
fi

rm -rf "${go_install_path}/go"
tar -zxvf "${tar_gz_filepath}" -C "${go_install_path}"

setup_for_go () {
local config_file="$1"

cat <<-EOF | tee --append "${config_file}"
golang_bin_path="${go_install_path}/go/bin"
EOF

cat <<-'EOF' | tee --append "${config_file}"
if [[ -d "${golang_bin_path}" ]]\
&& [[ -n "${PATH##*${golang_bin_path}}" ]]\
&& [[ -n "${PATH##*${golang_bin_path}:*}" ]]; then
    export PATH="${PATH}:${golang_bin_path}"
fi
EOF

}

setup_for_go "${HOME}"/.profile
setup_for_go "${HOME}"/.zprofile
