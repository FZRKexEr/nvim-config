nnoremap <space>r :call Cmp() <CR>
function! Cmp() 
  execute "w"
  if &filetype == 'cpp'
    execute "AsyncRun -mode=term -pos=bottom -rows=8 g++ % -o %< -std=c++17 -Wall -O2 && ./%< && mv %< ~/.trash" 
  elseif &filetype == 'lua' 
    execute "AsyncRun -mode=bang lua % "
  elseif &filetype == 'sh' 
    execute "AsyncRun -mode=bang sh %"
  else
    execute "echo \"Unsupported language\""
  endif
endfunction
