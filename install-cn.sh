rm -rf ~/.config/nvim.bak
rm -rf ~/.local/share/nvim/
mv ~/.config/nvim ~/.config/nvim.bak
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://ghproxy.com/https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
git clone https://ghproxy.com/https://github.com/FZRKexEr/nvim-config.git ~/.config/nvim/
echo "let g:plug_url_format='https://ghproxy.com/https://github.com/%s'" >> ~/.config/nvim/init.vim
cat > ~/.config/nvim/lua/configs/nvim-treesitter.lua <<EOF
require("nvim-treesitter.install").prefer_git = true
for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
  config.install_info.url = config.install_info.url:gsub("https://ghproxy.com/https://github.com/", "something else")
end

require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
EOF
