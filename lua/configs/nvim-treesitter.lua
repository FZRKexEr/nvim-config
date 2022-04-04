require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
--  ensure_installed = {"cpp", "c", "python", "bash", "lua", "vim"},
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
