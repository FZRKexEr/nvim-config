rm -rf ~/.config/nvim.bak
mv ~/.config/nvim ~/.config/nvim.bak
rm -rf ~/.local/share/nvim/
git clone https://github.com/FZRKexEr/nvim-config.git ~/.config/nvim/
nvim
