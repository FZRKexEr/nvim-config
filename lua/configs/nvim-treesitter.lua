require("nvim-treesitter.install").prefer_git = true
for _, config in pairs(require("nvim-treesitter.parsers").get_parser_configs()) do
  config.install_info.url = config.install_info.url:gsub("https://ghproxy.com/https://github.com/", "something else")
end

require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "cpp",
    "html",
    "java",
    "javascript",
    "json",
    "json5",
    "latex",
    "lua",
    "llvm",
    "python",
    "typescript",
    "vim",
  },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

