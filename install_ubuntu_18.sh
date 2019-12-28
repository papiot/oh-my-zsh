#!/bin/bash

echo "Setting up Oh My Zsh"

# ref: https://askubuntu.com/a/30157/8698
if ! [ $(id -u) = 0 ]; then
  echo "The script needs to be run as root." >&2
  exit 1
fi

#if [ $SUDO_USER ]; then
#  real_user=$SUDO_USER
#else
#  real_user=$(whoami)
#fi

echo "Updating apt-get..."
sudo apt-get update


echo "Installing zsh...."
sudo apt install zsh

echo "Installing additional libs..."
sudo apt-get install powerline fonts-powerline

echo "Cloning the Oh My Zsh..."
git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh

echo "Creating a new ZSH config file..."
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc

echo "Applying cool theme..."
sed -i 's/ZSH_THEME=.*/ZSH_THEME="agnoster"/' ~/.zshrc

echo "Changing default shell to zsh..."
chsh -s /bin/zsh




