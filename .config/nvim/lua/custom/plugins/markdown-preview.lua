return {
  'iamcco/markdown-preview.nvim',
  cmd = { 'MarkdownPreview', 'MarkdownPreviewStop', 'MarkdownPreviewToggle' },
  ft = { 'markdown' },
  build = function()
    vim.fn['mkdp#util#install']()
  end,
  config = function()
    -- Configure the plugin
    vim.g.mkdp_auto_start = 0
    vim.g.mkdp_auto_close = 1
    vim.g.mkdp_refresh_slow = 0
    vim.g.mkdp_command_for_global = 0
    
    -- WSL-specific settings
    vim.g.mkdp_open_to_the_world = 0
    vim.g.mkdp_open_ip = '127.0.0.1'
    vim.g.mkdp_port = '8090'
    
    -- Open preview in the default browser in WSL
    vim.g.mkdp_browser = ''
    vim.g.mkdp_echo_preview_url = 1  -- Show the preview URL when opened
    
    -- Custom browser opener for WSL
    vim.g.mkdp_browserfunc = 'g:OpenMarkdownPreview'
    
    -- Function to open URLs in the default Windows browser from WSL
    vim.cmd([[  
      function! g:OpenMarkdownPreview(url)
        let cmd = ''
        if executable('wslview')
          let cmd = 'wslview ' . a:url
        elseif executable('explorer.exe')
          let cmd = 'explorer.exe ' . a:url
        elseif executable('powershell.exe')
          let cmd = 'powershell.exe -command "Start-Process ' . a:url . '"'
        elseif executable('cmd.exe')
          let cmd = 'cmd.exe /c start ' . a:url
        elseif executable('xdg-open')
          let cmd = 'xdg-open ' . a:url
        elseif executable('open')
          let cmd = 'open ' . a:url
        endif
        
        if cmd != ''
          call system(cmd)
        else
          echo "Preview URL: " . a:url
        endif
      endfunction
    ]])
    
    vim.g.mkdp_page_title = '「${name}」'
    
    -- Set up keybinding for toggling markdown preview
    vim.keymap.set('n', '<leader>mp', '<cmd>MarkdownPreviewToggle<CR>', { 
      desc = '[M]arkdown [P]review toggle',
      silent = true 
    })
  end,
}