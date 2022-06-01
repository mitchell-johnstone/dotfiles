"------------------------------------------------------------
" Indentation options

" For Python files, set the correct indenting standards to follow PEP 8 
au BufNewFile,BufRead *.py 
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix 

au BufNewFile,BufRead *.cpp
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set smartindent |
    \ set showmatch |
    \ set fileformat=unix 

" Meanwhile, for full stack development, modify the settings a bit
" to format it properly
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2
	
" Enable folding
set foldmethod=indent
set foldlevel=99
