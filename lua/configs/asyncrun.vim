let g:asyncrun_open = 8
nnoremap <space>r :call CodeRunner() <CR>

function! CodeRunner() 
  silent execute "w"
  if &filetype == 'cpp'
    execute "AsyncRun -post=silent\\ execute\\ '!rm\\ a.out' -mode=term -pos=right -save=1 g++ -std=c++17 -Wall -O2 \"$(VIM_FILEPATH)\" && ./a.out"
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

if executable('oj')

  nnoremap <space>t :call TestSamples() <CR>

  function! s:ReadProblemURLFromCurrentBuffer()
    let l:lines = getline(0, line("$"))
    for l:line in l:lines
      let l:record = split(l:line, ' ')
      for l:r in l:record
        let l:url = matchstr(r, '^\(http\|https\):.*$')
        if l:url != ''
          return l:url
        endif
      endfor
    endfor
    return ''
  endfunction
  
  function! s:MakeSampleDLCommand(url)
    let l:cur_buf_dir = expand("%:h")
    let l:target_dir = l:cur_buf_dir . "/test"
    let l:dl_command = printf("oj download -d %s %s", l:target_dir, a:url)
    return l:dl_command
  endfunction
  function! s:DownloadSamples(url)
    let l:command = s:MakeSampleDLCommand(a:url)
    return l:command
"    call execute("AsyncRun -mode=term -pos=right -save=1 " . l:command)
  endfunction
  
"  command! -nargs=0 DownloadSamples :call s:DownloadSamples(s:ReadProblemURLFromCurrentBuffer())
  
  function! s:MakeTestSamplesCommand()
    let l:cur_buf_cpp = expand("%")
    let l:cur_buf_dir = expand("%:h")
    let l:sample_file_dir = l:cur_buf_dir . "/test"
    let l:test_command = printf("g++ -DONLINE_JUDGE -DLOCAL_TEST %s && oj test -d %s -t 4",l:cur_buf_cpp, l:sample_file_dir)
    return l:test_command
  endfunction

  function! TestSamples() " s:TestSamples()
    let l:cur_buf_dir = expand("%:h")
    let l:target_sample = l:cur_buf_dir . "/test/sample-1.in"
    if filereadable(target_sample) == 0 
      let l:command = s:DownloadSamples(s:ReadProblemURLFromCurrentBuffer()) . " && " . s:MakeTestSamplesCommand()
      call execute("AsyncRun -post=silent\\ execute\\ '!rm\\ a.out' -mode=term -pos=right -save=1 " . l:command)
    else
      let l:command = s:MakeTestSamplesCommand()
      call execute("AsyncRun -post=silent\\ execute\\ '!rm\\ a.out' -mode=term -pos=right -save=1 " . l:command)
    endif
  endfunction
  
"  command! -nargs=0 TestSamples :call s:TestSamples()
  
  function! s:MakeSubmitCommand(url)
    let l:cur_buf_cpp = expand("%")
    let l:submit_command = printf("oj submit -y %s %s", a:url, l:cur_buf_cpp)
    return l:submit_command
  endfunction
  function! s:SubmitCode(url)
    let l:command = s:MakeSubmitCommand(a:url)
    call execute("AsyncRun -post=silent\\ execute\\ '!rm\\ a.out' -mode=term -pos=right -save=1 " . l:command)
  endfunction
  
  command! -nargs=0 SubmitCode :call s:SubmitCode(s:ReadProblemURLFromCurrentBuffer())
endif
