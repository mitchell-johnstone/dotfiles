" Templates!
if has("autocmd")
	augroup templates
		" autocmd BufNewFile *cpp 0r ~/.vim/templates/skeleton.cpp | 44
		autocmd BufNewFile *cpp 0r ~/.vim/templates/kactl.cpp | 14
	augroup END
endif
