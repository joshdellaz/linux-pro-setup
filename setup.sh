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

cd
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp .tmux/.tmux.conf.local .


git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh
echo ":set number" >> ~/.vimrc


sudo apt-get install zsh -y

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

echo follow instructions for font install on powerlevel10k... press enter to continue
read dummy
echo set terminal preference profile color shceme to Tango dark and palatte to Solarized

sed -i 's/ZSH_THEME="robbyrussell"/ZSH_THEME="powerlevel10k\/powerlevel10k"/' ~/.zshrc

exec zsh
