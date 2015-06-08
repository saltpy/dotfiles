#!/usr/bin/env bash

mkdir ~/src

eval "$(ssh-agent -s)"
ssh-add ~/.ssh/cocoon_id_rsa
git config --global user.name "James Salt"
git config --global user.email "saltpy@gmail.com"

cd src
git clone git@github.com/saltpy/dotfiles.git
./install.sh
cd -

sudo apt-get install -y python-setuptools python-dev python-crypto python-pip python-virtualenv
