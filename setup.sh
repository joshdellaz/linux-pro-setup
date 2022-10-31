#!/bin/sh

#insert bash thing here
sudo apt-get install tmux -y
sudo apt-get install vim -y
sudo apt-get install ghex -y
sudo apt-get install octave -y
sudo apt-get install python3 -y
sudo apt-get install gcc -y
sudo apt-get install g++ -y
sudo apt-get install doxygen -y
sudo apt-get install git -y
sudo apt-get install cmake -y
sudo apt-get install exuberant-ctags -y
pip install robotframework

sudo apt-get install wget gpg
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
rm -f packages.microsoft.gpg
sudo apt install apt-transport-https
sudo apt update
sudo apt install code # or code-insiders

cd
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

sudo apt-get install zsh -y

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo follow instructions for font install on powerlevel10k... press enter to continue
read dummy
echo set terminal preference profile color shceme to Tango dark and palatte to Solarized

sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

exec zsh
