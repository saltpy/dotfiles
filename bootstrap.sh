#!/usr/bin/env bash

rm -rf ~/src ~/bin ~/lib ~/doc ~/art ~/env
mkdir -p ~/src ~/bin ~/lib ~/doc ~/art ~/env ~/www ~/log

sudo apt-get update --fix-missing
sudo apt-get install -y vim build-essential python-dev git python-virtualenv

git config --global user.name "James Salt"
git config --global user.email "saltpy@gmail.com"
git config --global core.autoclrf false

pushd ~/src
git clone git@github.com:saltpy/dotfiles
pushd dotfiles
bash install.sh
popd
popd
