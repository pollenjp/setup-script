#!/bin/bash
# execute by user

cd
directory="${HOME}/dotfiles"
if [ ! -d "$directory" ] 
then
	git clone git@bitbucket.org:pollenjp/dotfiles.git
fi


directory="${HOME}/.config"
if [ ! -d "$directory" ] 
then
	mkdir "$directory"
fi

directory1="${HOME}/dotfiles/_vim"
directory2="${HOME}/.config/nvim"
directory3="${HOME}/.vim"
ln -s "$directory1" "$directory2"
ln -s "$directory1" "$directory3"

file1="${HOME}/dotfiles/_vimrc"
file2="${HOME}/.config/nvim/init.vim"
file2="${HOME}/.vimrc
ln -s "$file1" "$file2"
ln -s "$file1" "$file3"


cd "${HOME}/dotfiles/_vim/bundle"
git clone git://github.com/Shougo/neobundle.vim


