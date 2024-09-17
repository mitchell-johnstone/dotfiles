-- tpope, what a dude
return {
  { "tpope/vim-abolish" },
  {
    "tpope/vim-dispatch",
    config = function()
      -- For init.lua
      -- Only run on my repo
      local function MypyCheck()
        local cwd = vim.fn.expand('%:p:h')
        local repo_path = vim.fn.expand('~/repos/account-manager-assistant')
        if cwd:sub(1, #repo_path) == repo_path then
          vim.notify('Running MypyCheck...', 'info', { title = 'MypyCheck' })

          -- -- Run the command asynchronously
          -- local tmpfile = vim.fn.tempname()
          -- vim.loop.spawn('sh', {
          --   args = { '-c', 'cd ' .. repo_path .. '/src && pipenv run typecheck-ci > ' .. tmpfile .. ' 2>&1' },
          -- }, function(code, signal)
          --   vim.schedule(function()
          --     if code ~= 0 then
          --       vim.notify('MypyCheck failed', 'error', { title = 'MypyCheck' })

          --       -- Read the output file
          --       local output = vim.fn.readfile(tmpfile)

          --       -- Split the output into lines
          --       local lines = vim.split(table.concat(output, '\n'), '\n')

          --       -- Create a list of quickfix items
          --       local qf_list = {}
          --       for _, line in ipairs(lines) do
          --         local filename, lnum, err, text = line:match('([^:]+):(%d+): ([^:]+): (.+)')
          --         if filename and lnum and err and text then
          --           table.insert(qf_list, {
          --             filename = 'src/'..filename,
          --             lnum = tonumber(lnum),
          --             text = err .. ': ' .. text,
          --           })
          --         end
          --       end

          --       -- Set the quickfix list
          --       vim.fn.setqflist(qf_list, 'r')
          --       vim.cmd('copen')
          --     else
          --       vim.notify('MypyCheck completed successfully', 'info', { title = 'MypyCheck' })
          --     end
          --   end)
          -- end)
        else
          vim.notify('Not in the correct directory', 'warn', { title = 'MypyCheck' })
        end
      end

      vim.api.nvim_create_user_command('MypyCheck', MypyCheck, {})

      vim.api.nvim_create_autocmd('BufWritePost', {
        pattern = '*.py',
        callback = MypyCheck,
      })
    end,
  }
}
-- vim: ts=2 sts=2 sw=2 et
