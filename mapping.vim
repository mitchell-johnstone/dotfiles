"------------------------------------------------------------
"Mappings!

" Enable folding with the spacebar
nnoremap <space> za

" Enable yanking of whole file with .
" nnoremap Y :%y+ <Enter>
nnoremap Y :!cat "%" <Bar> clip.exe <Enter>
"nnoremap <C-J> :w <bar> !cls && g++ % <Enter> 
"nnoremap <C-K> :!a.exe <ENTER>

inoremap { {}<Left>
inoremap {<CR> {<CR>}<Esc>O
inoremap {{ {
inoremap {} {}

inoremap """<CR> """<CR>"""<Esc>O

autocmd filetype cpp nnoremap <F9> :w <bar> !clear & g++ -std=c++17 "%" -o "%:r" <CR>
autocmd filetype cpp nnoremap <F10> :!clear & "./%:r" <CR>
autocmd filetype cpp nnoremap <C-C> :s/^\(\s*\)/\1\/\/<CR> :s/^\(\s*\)\/\/\/\//\1<CR> $
