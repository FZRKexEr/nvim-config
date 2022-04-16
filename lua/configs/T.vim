nnoremap tt :call T#Main(expand('<cword>'))<cr>
vnoremap tt :<c-u>call T#VisualSearch(visualmode())<cr>
let g:TWinSize = 50
