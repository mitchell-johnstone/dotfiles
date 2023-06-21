"------------------------------------------------------------
"Mappings!

" Enable folding with the spacebar
nnoremap <space> za

" Enable yanking of whole file with .
" nnoremap Y :%y+ <Enter>
nnoremap Y :!cat "%" <Bar> clip.exe <Enter>
"nnoremap <C-J> :w <bar> !cls && g++ % <Enter> 
"nnoremap <C-K> :!a.exe <ENTER>

" Project wide searh for word
nnoremap <F4> :grep! "\<<cword>\>" . -r<CR>:copen<CR>

" auto bracket completion
inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

" Python triple quotes for string comments
autocmd filetype python inoremap """<CR> """<CR>"""<Esc>O

" C++ compilation and execution, and commenting
autocmd filetype cpp nnoremap <F9> :w <bar> !clear & g++ -std=c++17 "%" -o "%:r" <CR>
autocmd filetype cpp nnoremap <F10> :!clear & "./%:r" <CR>
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $
