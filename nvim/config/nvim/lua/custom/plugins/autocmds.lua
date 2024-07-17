-- Helpful info about these commands
-- https://stackoverflow.com/questions/77147995/setting-up-formatters-in-neovim-with-mason-lsp-zero

-- Create group to assign commands
-- "clear = true" must be set to prevent loading an
-- auto-command repeatedly every time a file is resourced
local autocmd_group = vim.api.nvim_create_augroup("Custom auto-commands", { clear = true })

-- Python files should have a different fold method
-- https://www.reddit.com/r/neovim/comments/11tjpu7/trying_to_set_filetype_using_autocmd/
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = {"*.py"},
    command = "set foldmethod=indent",
    group = autocmd_group,
})

-- Format python files using black when saving
-- https://neovim.io/doc/user/autocmd.html
-- https://stackoverflow.com/questions/77147995/setting-up-formatters-in-neovim-with-mason-lsp-zero
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    pattern = { "*.py" },
    desc = "Auto-format Python files after saving",
    callback = function()
        local fileName = vim.api.nvim_buf_get_name(0)
        vim.cmd(":silent !black --preview -q " .. fileName)
        vim.cmd(":silent !isort --profile black --float-to-top -q " .. fileName)
        vim.cmd(":silent !docformatter --in-place --black " .. fileName)
    end,
    group = autocmd_group,
})

return {}
