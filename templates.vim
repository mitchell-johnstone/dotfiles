" Templates!
if has("autocmd")
	augroup templates
		autocmd BufNewFile *cpp 0r ~/.vim/templates/skeleton.cpp | 44
	augroup END
endif
