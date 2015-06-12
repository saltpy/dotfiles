#!/usr/bin/env bash

rm -rf ~/src ~/bin ~/lib ~/doc ~/art
mkdir -p ~/src ~/bin ~/lib ~/doc ~/art

sudo apt-get update
sudo apt-get fix-missing
sudo apt-get install -y build-essential python-dev git python-setuptools python-dev python-crypto python-pip python-virtualenv

virtualenv ~/fab
. ~/fab/bin/activate
pip install fabric
deactivate

git config --global user.name "James Salt"
git config --global user.email "saltpy@gmail.com"
git config --global core.autoclrf false

git clone http://github.com/saltpy/dotfiles.git src/dotfiles
bash src/dotfiles/install.sh
