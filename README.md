## Backup of existing configs

mv ~/.config/nvim{,.bak}
mv ~/.config/hypr{,.bak}
mv ~/.config/kitty{,.bak}
mv ~/.config/tmux{,.bak}
mv ~/.config/waybar{,.bak}


## TMUX setup

For the tmux setup to work first run
```git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm```
Afterwards run tmux package installer by running <C-space> I, you know it worked if theme changed

## NVIM setup
For the nvim setup to work first run
```
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 ~/.local/share/nvim/site/pack/packer/start/packer.nvim
```
then open the packer.lua inside /lua/raysuo, run :so then :PackerSync
