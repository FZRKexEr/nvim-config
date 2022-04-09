rm -rf ~/.config/nvim.bak
rm -rf ~/.local/share/nvim/
mv ~/.config/nvim ~/.config/nvim.bak

git clone https://github.com/FZRKexEr/nvim-config.git ~/.config/nvim/

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
