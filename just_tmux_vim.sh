#!/bin/sh

#insert bash thing here
sudo apt-get install tmux -y
sudo apt-get install vim -y
sudo apt-get install exuberant-ctags -y

git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .


git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
echo ":set number" >> ~/.vimrc

cd ~/.vim/bundle
git clone https://github.com/ludovicchabant/vim-gutentags.git
vim
:call pathogen#helptags()
:q!
