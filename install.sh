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

. ~/.bashrc

# eclim headless
if [ "$1" == "--with-eclim" ]
then
sudo apt-get install default-jdk xvfb build-essential -y
sudo apt-get install eclipse -y
sudo apt-get install maven -y
curl -LO http://downloads.sourceforge.net/project/eclim/eclim/1.7.14/eclim_1.7.14.jar
java \
-Dvim.files=$HOME/.vim \
-Declipse.home=$ECLIPSE_HOME \
-jar eclim_1.7.14.jar install
fi
