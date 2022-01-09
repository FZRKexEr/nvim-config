vim.api.nvim_exec([[
call plug#begin()

  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'dense-analysis/ale'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'skywind3000/asyncrun.vim'
  Plug 'feline-nvim/feline.nvim'

call plug#end()

colorscheme tokyonight
set signcolumn=yes

nnoremap <space>r :call Cmp() <CR>
function! Cmp() 
  execute "w"
  if &filetype == 'cpp'
    execute "AsyncRun -mode=term -pos=bottom -rows=8 g++ % -o %< -std=c++17 -Wall -O2 && ./%< && rm %<" 
  elseif &filetype == 'lua' 
    execute "AsyncRun -mode=term -pos=bottom -rows=8 lua % "
  else 
    execute "echo \"Unsupported language\""
  endif
endfunction

]], false)

require('nvim-treesitter.configs').setup {
  ensure_installed = "maintained",
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

require('feline').setup {
    preset = 'noicon'
}
