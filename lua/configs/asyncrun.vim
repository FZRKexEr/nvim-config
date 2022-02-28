let g:asyncrun_open = 8

nnoremap <space>r :call Cmp() <CR>
function! Cmp() 
  execute "w"
  if &filetype == 'cpp'
    execute "AsyncRun -mode=term -pos=right -save=1 /opt/homebrew/bin/g++-11 -lstdc++ -std=c++17 \"$(VIM_FILEPATH)\" -o \"$(VIM_FILEDIR)/$(VIM_FILENOEXT)\" -Wall -O2 && $(VIM_FILEDIR)/$(VIM_FILENOEXT) && mv $(VIM_FILEDIR)/$(VIM_FILENOEXT) ~/.trash"
  elseif &filetype == 'lua' 
    execute "AsyncRun -mode=bang lua $(VIM_FILEPATH)"
  elseif &filetype == 'sh' 
    execute "AsyncRun -mode=bang sh $(VIM_FILEPATH)"
  elseif &filetype == 'python'
    execute "AsyncRun -save=1 python3 $(VIM_FILEPATH)"
  else
    execute "echo \"Unsupported language\""
  endif
endfunction
