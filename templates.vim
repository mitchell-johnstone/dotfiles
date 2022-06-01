" Templates!
if has("autocmd")
	augroup templates
		autocmd BufNewFile *cpp 0r ~/vimfiles/templates/skeleton.cpp | 51
	augroup END
endif
