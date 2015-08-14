#!/usr/bin/env bash

rm -f ~/.bashrc
rm -f ~/.vimrc
rm -rf ~/.vim

mkdir -p ~/.vim
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/autoload

pushd ~/src/dotfiles
cp bashrc ~/.bashrc
cp vimrc ~/.vimrc
cp -R pip ~/.pip
popd

pushd ~/.vim/autoload
curl -LSso pathogen.vim https://tpo.pe/pathogen.vim
popd

pushd ~/.vim/bundle
git clone git@github.com:kien/ctrlp.vim
git clone git@github.com:altercation/vim-colors-solarized
git clone git@github.com:ervandew/supertab
popd

