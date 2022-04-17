let g:asyncrun_open = 8

nnoremap <space>r :call CodeRunner() <CR>

function! CodeRunner() 
  silent execute 'w'
  let l:run = 'AsyncRun -mode=term -pos=right -save=1 '
  let l:cmd = {}

  if executable('g++-11')
    let l:cmd['cpp'] = "g++-11 -std=c++17 -Wall -O2 \"$(VIM_FILEPATH)\" && ./a.out"
  else
    let l:cmd['cpp'] = "g++ -std=c++17 -Wall -O2 \"$(VIM_FILEPATH)\" && ./a.out"
  endif

  let l:cmd['cpp'] = "-post=silent\\ execute\\ '!rm\\ a.out' " . l:cmd['cpp']
  let l:cmd['python'] = 'python3 $(VIM_FILEPATH) '
  let l:cmd['lua'] = 'lua $(VIM_FILEPATH) '
  let l:cmd['sh'] = 'sh $(VIM_FILEPATH) '
  
  if has_key(cmd, &filetype)
    execute l:run . l:cmd[&filetype] 
  else
    echo 'Unsupported language'
  endif
endfunction

if executable('oj')

  nnoremap <space>t :call TestSamples() <CR>

  function! s:ReadProblemURLFromCurrentBuffer()
    let l:lines = getline(0, line('$'))
    for l:line in l:lines
      let l:record = split(l:line, ' ')
      for l:r in l:record
        let l:url = matchstr(r, '^\(http\|https\):.*$')
        if l:url !=? ''
          return l:url
        endif
      endfor
    endfor
    return ''
  endfunction
  
  function! s:MakeSampleDLCommand(url)
    let l:cur_buf_dir = expand('%:h')
    let l:target_dir = l:cur_buf_dir . '/test'
    let l:dl_command = printf('oj download -d %s %s', l:target_dir, a:url)
    return l:dl_command
  endfunction
  function! s:DownloadSamples(url)
    let l:command = s:MakeSampleDLCommand(a:url)
    return l:command
"    call execute("AsyncRun -mode=term -pos=right -save=1 " . l:command)
  endfunction
  
"  command! -nargs=0 DownloadSamples :call s:DownloadSamples(s:ReadProblemURLFromCurrentBuffer())
  
  function! s:MakeTestSamplesCommand()
    let l:cur_buf_cpp = expand('%')
    let l:cur_buf_dir = expand('%:h')
    let l:sample_file_dir = l:cur_buf_dir . '/test'
    let l:test_command = printf('g++ -DONLINE_JUDGE -DLOCAL_TEST %s && oj test -d %s -t 4',l:cur_buf_cpp, l:sample_file_dir)
    return l:test_command
  endfunction

  function! TestSamples() " s:TestSamples()
    let l:cur_buf_dir = expand('%:h')
    let l:target_sample = l:cur_buf_dir . '/test/sample-1.in'
    if filereadable(target_sample) == 0 
      let l:command = s:DownloadSamples(s:ReadProblemURLFromCurrentBuffer()) . ' && ' . s:MakeTestSamplesCommand()
      call execute("AsyncRun -post=silent\\ execute\\ '!rm\\ a.out' -mode=term -pos=right -save=1 " . l:command)
    else
      let l:command = s:MakeTestSamplesCommand()
      call execute("AsyncRun -post=silent\\ execute\\ '!rm\\ a.out' -mode=term -pos=right -save=1 " . l:command)
    endif
  endfunction
  
"  command! -nargs=0 TestSamples :call s:TestSamples()
  
  function! s:MakeSubmitCommand(url)
    let l:cur_buf_cpp = expand('%')
    let l:submit_command = printf('oj submit -y %s %s', a:url, l:cur_buf_cpp)
    return l:submit_command
  endfunction
  function! s:SubmitCode(url)
    let l:command = s:MakeSubmitCommand(a:url)
    call execute("AsyncRun -post=silent\\ execute\\ '!rm\\ a.out' -mode=term -pos=right -save=1 " . l:command)
  endfunction
  
  command! -nargs=0 SubmitCode :call s:SubmitCode(s:ReadProblemURLFromCurrentBuffer())
endif
