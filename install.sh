#!/usr/bin/env bash

git submodule init
git submodule update

ln -s ./vimrc ~/.vimrc
ln -s ./vim ~/.vim
