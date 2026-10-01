#!/bin/bash

echo "Running script"
echo "Creating backup of hypr, nvim, kitty, tmux and waybar"

# Create backups
mv ~/.config/nvim{,.bak}
mv ~/.config/hypr{,.bak}
mv ~/.config/kitty{,.bak}
mv ~/.config/tmux{,.bak}
mv ~/.config/waybar{,.bak}

echo "Moving new config files into ~/.config/"

# Move the new config files
cp "$PWD/nvim" ~/.config/
cp "$PWD/hypr" ~/.config/
cp "$PWD/kitty" ~/.config/
cp "$PWD/tmux" ~/.config/
cp "$PWD/waybar" ~/.config/

# Install packer.nvim and tmux package

echo "Installing tmux tpm"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 

# Relaunch waybar
killall -9 waybar
waybar &
