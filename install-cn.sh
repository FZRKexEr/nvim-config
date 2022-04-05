rm -rf ~/.config/nvim.bak
rm -rf ~/.local/share/nvim/
mv ~/.config/nvim ~/.config/nvim.bak
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://ghproxy.com/https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
git clone https://ghproxy.com/https://github.com/FZRKexEr/nvim-config.git ~/.config/nvim/
echo "let g:plug_url_format='https://ghproxy.com/https://github.com/%s'" >> ~/.config/nvim/init.vim

