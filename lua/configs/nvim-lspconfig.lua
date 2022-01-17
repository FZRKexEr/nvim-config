local M = {}

vim.cmd('set signcolumn=yes')

vim.diagnostic.config({
  virtual_text = {
    source = "always",  -- Or "if_many"
    prefix = '■', -- Could be '●', '▎', 'x'
  },
  float = {
    source = "always",  -- Or "if_many"
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = false,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

return M

