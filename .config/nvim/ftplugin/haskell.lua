-- compile and run the current haskell file
vim.keymap.set("n", "<leader>r" , ":w <bar> :split <bar> execute 'terminal ghc % && ./%<'<CR>")
