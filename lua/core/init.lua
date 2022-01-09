vim.api.nvim_exec([[
filetype on
set nocompatible
set encoding=UTF-8

set cindent
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2

set wrap
syntax on
set number
let &t_ut=''
set hlsearch
set termguicolors
set background=dark
set clipboard=unnamed
]], false)
