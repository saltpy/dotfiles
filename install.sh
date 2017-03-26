#!/usr/bin/env bash

set -e

touch ~/.bash_profile
touch ~/.vimrc
mv ~/.bash_profile ~/.bash_profile.old
mv ~/.vimrc ~/.vimrc.old
rm -rf ~/.vim

mkdir -p ~/.vim
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/autoload

pushd ~/src/dotfiles
cp bash_profile ~/.bash_profile
cp vimrc ~/.vimrc
cp bash_prompt ~/.bash_prompt
popd

pushd ~/.vim/autoload
curl -LSso pathogen.vim https://tpo.pe/pathogen.vim
popd

pushd ~/.vim/bundle
git clone git@github.com:kien/ctrlp.vim
git clone git@github.com:altercation/vim-colors-solarized
git clone git@github.com:ervandew/supertab
popd

pushd lib
rm -rf shunit2
git clone git@github.com:kward/shunit2 > /dev/null 
popd

mkdir -p ~/lib
mkdir -p ~/bin

cp -R ./lib/* ~/lib/
cp -R ./bin/* ~/bin/
