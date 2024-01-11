--:autocmd BufNewFile *.cpp	0r ~/.config/nvim/skeletons/skeleton.c
--vim.keymap.set("n", "<leader>r" , ":!g++ % -o %< && ./%<<cr>") --cpp run
--vim.keymap.set("n", "<leader>r" , ":w <bar> !g++ % -o %< && ./%<<cr>") --cpp run
vim.keymap.set("n", "<leader>r" , ":w <bar> :split <bar> execute 'terminal g++ % -o %< && ./%<'<CR>") --cpp run
-- vim.keymap.set("n", "<leader>r" , ":w <bar> !g++ -Wall -Werror -pedantic -std=c++17 % -o %< && ./%<<cr>") --cpp run
