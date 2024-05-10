#!/bin/bash

echo "Welcome to Linux setup"
echo "----------------------"
echo "Updating System, Provide password for sudo."

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

#dracula theme installation

echo "-------------------------------------------"
echo "Do you wish to install dracula theme: [y/n]"
read dracula
if [[ $dracula == "y" || $dracula == "Y" ]]
then
  echo "Installing Dracula theme"
  apt install curl && apt install unzip &&
  curl -L https://github.com/dracula/gtk/archive/master.zip -o master.zip &&
  unzip ./master.zip &&
  mv ./gtk-master ~/.themes/dracula &&
  rm ./master.zip
  echo "---------------------------------------"
  echo "Dracula theme is successfully installed"
else
  echo "-----------------------------------"
  echo "Skipping Dracula theme installation"
fi

#vscode installation

echo "------------------------------------------"
echo "Do you wish to install vs-code: [y/n]"
read code
if [[ $code == "y" || $code == "Y" ]]
then
  curl -L "https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64" -o code.deb &&
 sudo dpkg -i code.deb &&
 rm code.deb
else
  echo "----------------------------"
  echo "Skipping VSCode installation"
fi

#firacode installation

echo "-------------------------------------------"
echo "Do you wish to install firacode font: [y/n]"
read font
if [[ $font == "y" || $font == "Y" ]]
then
  curl -L https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip -o firacode.zip &&
  unzip firacode.zip -d ./firacode &&
  mv firacode ~/.fonts/FiraCode &&
  rm firacode.zip
  echo "----------------------------"
  echo "Font installation successfull"
else
  echo "--------------------------"
  echo "Skipping font installation"
fi

#Set up starship
echo "-------------------------------------------"
echo "Do you wish to install starship prompt: [y/n]"
read prompt
if [[ $prompt == "y" || $prompt == "Y" ]]
then
  curl -sS https://starship.rs/install.sh | sh
else
  echo "------------------------------"
  echo "Skipping starship installation"
fi

#Setting up git client
echo "-------------------------------------------"
echo "Do you wish to set up github client: [y/n]"
read gh
if [[ $gh == "y" || $gh == "Y" ]]
then
  sudo apt install gh &&
  gh auth login
  #Login with your credentials
else
  echo "Skipping github client setup"
fi

echo "Linux setup has been completed!"
