"-----------------------------------------------------------
" General Settings {{
" setting up many neccessary settings
"
" Highlight extra whitespace for languages where spacing matters.
" au BufRead,BufNewFile *.py,*.pyw,*.c,*.cpp,*.h match BadWhitespace /\s\+$/

" This enable the user to copy, cut, paste from other applications into vim
set clipboard=unnamedplus

" Some options to optimise the auto-complete
let g:ycm_autoclose_preview_window_after_completion=1

" set backups
set backup
set writebackup
set backupdir=/tmp
set undodir=/tmp
set dir=/tmp
set backupcopy=yes

" Enable use of the mouse for all modes
set mouse=a

" Display line numbers on the left
set number

" highlight current line
set relativenumber

" set relative numbers
set cursorline

" Enable syntax
syntax on
colorscheme happy_hacking

" enable encoding
set encoding=utf-8

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

