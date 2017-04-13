#!/usr/bin/env bash

set -e

root=$(dirname $0)

echo "Clean"
rm -rf ~/.vim > /dev/null
mkdir -p ~/.vim > /dev/null

echo "Install bash config"
cp $root/bash_alias ~/.bash_alias
cp $root/bash_profile ~/.bash_profile
cp $root/bash_profile ~/.bashrc
cp $root/bash_prompt ~/.bash_prompt

echo "Install vim config"
cp $root/vimrc ~/.vimrc

echo "Install vim pathogen"
mkdir -p ~/.vim/autoload
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim > /dev/null

echo "Install vim bundles"
git clone git@github.com:altercation/vim-colors-solarized ~/.vim/bundle/vim-colours-solarized > /dev/null 2>&1
git clone git@github.com:artur-shaik/vim-javacomplete2 ~/.vim/bundle/vim-javacomplete2 > /dev/null 2>&1

echo "Install git config"
cp $root/gitconfig ~/.gitconfig

echo "Install ~/lib"
mkdir -p ~/lib
cp -R $root/lib ~/lib

echo "Install ~/bin"
mkdir -p ~/bin
cp -R $root/bin ~/bin
