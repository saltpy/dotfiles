#!/usr/bin/env bash

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

cd src
git clone http://github.com/saltpy/dotfiles.git
  cd dotfiles
  ./install.sh
  cd -
cd -
