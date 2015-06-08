#!/usr/bin/env bash

rm -f ~/.bashrc
rm -f ~/.vimrc
rm -rf ~/.vim

cp bashrc ~/.bashrc
cp vimrc ~/.vimrc
cp Vagrantfile ~/Vagrantfile

mkdir ~/.vim
mkdir ~/.vim/bundle
mkdir ~/.vim/autoload
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
cd ~/.vim/bundle
git clone git://github.com/kien/ctrlp.vim.git
git clone git://github.com/altercation/vim-colors-solarized.git
git clone git://github.com/ervandew/supertab.git
cd -
