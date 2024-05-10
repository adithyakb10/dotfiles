#!/bin/bash

echo "Welcome to Linux setup"
echo "----------------------"
apt update && apt upgrade

# Check if stow is installed
if ! command -v stow &> /dev/null
then
    echo "------------------------------------"
    echo "Stow is not installed. Installing..."
    # Install stow
    sudo apt-get install -y stow  # You may need to adjust this for other package managers
else
    echo "--------------------------"
    echo "Stow is already installed."
fi

# Initialize the current directory for stow
echo "------------------------------------------"
echo "Initializing current directory for stow..."
stow --adopt -v .  # This will make stow manage dotfiles in the current directory

echo "------------------------"
echo "Initialization complete."

echo "-------------------------------------------"
echo "Do you wish to install dracula theme: [y/n]"
read dracula
if [[ $dracula == "y" || $dracula == "Y" ]]
then
  echo "Installing Dracula theme"
  apt install curl && apt install unzip &&
  curl -L https://github.com/dracula/gtk/archive/master.zip -o master.zip &&
  unzip ./master.zip &&
  mv ./gtk-master ~/.themes/pokemon
  echo "---------------------------------------"
  echo "Dracula theme is successfully installed"
else
  echo "-----------------------------------"
  echo "Skipping Dracula theme installation"
fi
echo "------------------------------------------"
echo "Do you wish to install vs-code theme: [y/n]"
read code
if [[ $code == "y" || $code == "Y" ]]
then
  curl -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -o code.deb &&
 sudo dpkg -i code.deb
else
  echo "----------------------------"
  echo "Skipping VSCode installation"
fi

