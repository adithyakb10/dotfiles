#!/bin/bash

# Check if stow is installed
if ! command -v stow &> /dev/null
then
    echo "Stow is not installed. Installing..."
    # Install stow
    sudo apt-get install -y stow  # You may need to adjust this for other package managers
else
    echo "Stow is already installed."
fi

# Initialize the current directory for stow
echo "Initializing current directory for stow..."
stow --adopt -v .  # This will make stow manage dotfiles in the current directory

echo "Initialization complete."
