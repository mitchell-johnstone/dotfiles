" begin plug
call plug#begin('$HOME/vimfiles/plugged')

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Or build from source code by using yarn: https://yarnpkg.com
" Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" end plug
call plug#end()

" Ctags auto generation
" au BufWritePost *.c,*.cpp,*.h,*.py silent! !ctags -R &
au BufWritePost *.c,*.cpp,*.h silent! !ctags -R &
