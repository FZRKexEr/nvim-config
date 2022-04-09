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

