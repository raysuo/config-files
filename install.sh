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
mv "$PWD/nvim" ~/.config/
mv "$PWD/hypr" ~/.config/
mv "$PWD/kitty" ~/.config/
mv "$PWD/tmux" ~/.config/
mv "$PWD/waybar" ~/.config/

# Install packer.nvim and tmux package

echo "Installing packer and tmux tpm"

git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm 

# Relaunch waybar
killall -9 waybar
waybar &
