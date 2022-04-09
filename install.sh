rm -rf ~/.config/nvim.bak
rm -rf ~/.local/share/nvim/
mv ~/.config/nvim ~/.config/nvim.bak

git clone https://github.com/FZRKexEr/nvim-config.git ~/.config/nvim/

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://ghproxy.com/https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
