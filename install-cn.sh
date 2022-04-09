rm -rf ~/.config/nvim.bak
rm -rf ~/.local/share/nvim/
mv ~/.config/nvim ~/.config/nvim.bak


git clone https://github.wrong-answer.workers.dev/FZRKexEr/nvim-config.git ~/.config/nvim/

echo "let g:plug_url_format='https://github.wrong-answer.workers.dev/%s'" >> ~/.config/nvim/init.vim

cat > ~/.config/nvim/lua/configs/nvim-treesitter.lua <<EOF
require("nvim-treesitter.install").prefer_git = true
for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
  config.install_info.url = config.install_info.url:gsub("https://github.wrong-answer.workers.dev/", "something else")
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

sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://github-raw.wrong-answer.workers.dev/junegunn/vim-plug/master/plug.vim'
