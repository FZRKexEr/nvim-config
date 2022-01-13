vim.cmd('set signcolumn=yes')

-- icon:            
vim.g.ale_sign_error = ' '
vim.g.ale_sign_warning = ' '
vim.g.ale_set_loclist = 1
vim.g.ale_set_quickfix = 0
vim.g.ale_open_list = 0
vim.g.ale_virtualtext_cursor = 1
vim.g.ale_virtualtext_prefix = ' '

vim.cmd('highlight ALEVirtualTextError ctermfg=15 guifg=#db4b4b') 
vim.cmd('highlight ALEVirtualTextWarning ctermfg=224 guifg=#e0af68')
