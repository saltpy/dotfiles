#!/usr/bin/env bash

set -e

root=$(dirname $0)

echo $root

echo "Clean"
rm -rf ~/.bash_sessions
rm -rf ~/bin > /dev/null
rm -rf ~/lib > /dev/null
rm -rf ~/.vim > /dev/null

echo "Install bash config"
cp $root/bash_alias ~/.bash_alias
cp $root/bash_profile ~/.bash_profile
cp $root/bash_profile ~/.bashrc
cp $root/bash_prompt ~/.bash_prompt

echo "Install vim config"
cp $root/vimrc ~/.vimrc

echo "Install vim pathogen"
mkdir -p ~/.vim > /dev/null
mkdir -p ~/.vim/autoload > /dev/null
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim > /dev/null

echo "Install vim bundles"
git clone git@github.com:altercation/vim-colors-solarized ~/.vim/bundle/vim-colours-solarized > /dev/null 2>&1
git clone git@github.com:ervandew/supertab ~/.vim/bundle/supertab > /dev/null 2>&1

echo "Install git config"
cp $root/gitconfig ~/.gitconfig

echo "Install ~/bin"
mkdir -p ~/bin
cp -R $root/bin/* ~/bin/
