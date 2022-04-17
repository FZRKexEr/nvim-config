vim.cmd('set signcolumn=yes')

-- icon:            
vim.g.ale_sign_error = ' '
vim.g.ale_sign_warning = ' '
vim.g.ale_set_loclist = 0
vim.g.ale_set_quickfix = 0
vim.g.ale_open_list = 1
vim.g.ale_list_window_size = 5
vim.g.ale_keep_list_window_open = 1
--vim.g.ale_list_vertical = 1

vim.g.ale_virtualtext_cursor = 1
vim.g.ale_virtualtext_prefix = ' '

vim.cmd('highlight ALEVirtualTextError ctermfg=15 guifg=#db4b4b') 
vim.cmd('highlight ALEVirtualTextWarning ctermfg=224 guifg=#e0af68')


--vim.cmd("let g:ale_linters = {'cpp': ['cc', 'cppcheck']}")
vim.cmd("let g:ale_linters = {'cpp': ['cc']}")

-- vim.g.ale_linters_explicit = 1 -- 1 只运行 ale_linters 中的 Lints 0 只把cpp 的linters 限定成 cc，其他不变
--vim.g.ale_echo_msg_format = '[%linter%] %code: %%s'
vim.g.ale_echo_msg_format = '[%linter%] %s'

vim.g.ale_cpp_cc_executable = 'g++-11' -- 直接跑本地编译然后返回编译结果
vim.g.ale_cpp_cc_options = '-std=c++17 -Wall -O2'

vim.g.ale_cpp_cppcheck_options = '-std=c++17 -Wall -O2'
