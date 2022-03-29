let g:asyncrun_open = 8

nnoremap <space>r :call Cmp() <CR>

function! Cmp() 
  execute "w"
  if &filetype == 'cpp'

"    execute "AsyncRun -mode=term -pos=right -save=1 g++-11 -std=c++17 \"$(VIM_FILEPATH)\" -o \"$(VIM_FILEDIR)/$(VIM_FILENOEXT)\" -Wall -O2 && (./$(VIM_FILENOEXT) ; rm ./$(VIM_FILENOEXT) )"
  execute "AsyncRun -mode=term -pos=right -save=1 g++-11 -std=c++17 \"$(VIM_FILEPATH)\" -o \"$(VIM_FILEDIR)/$(VIM_FILENOEXT)\" -Wall -O2 && ./$(VIM_FILENOEXT) && rm ./$(VIM_FILENOEXT)"
  

  elseif &filetype == 'lua' 
    execute "AsyncRun -mode=term -pos=right -save=1 lua $(VIM_FILEPATH) "
  elseif &filetype == 'sh' 
    execute "AsyncRun -mode=term -pos=right -save=1 sh $(VIM_FILEPATH) "
  elseif &filetype == 'python'
    execute "AsyncRun -mode=term -pos=right -save=1 python3 $(VIM_FILEPATH) "
  else
    execute "echo \"Unsupported language\""
  endif
endfunction
