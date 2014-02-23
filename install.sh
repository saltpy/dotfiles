#!/usr/bin/env bash

git pull origin master
git submodule init
git submodule update

sudo apt-get update
sudo apt-get install curl -y
mkdir -p vim/autoload
curl -Sso vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim

rm -f ~/.vimrc
cp vimrc ~/.vimrc
rm -f ~/.bashrc
cp bashrc ~/.bashrc
rm -rf ~/.vim
cp -R vim ~/.vim
