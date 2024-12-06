return {
  {
    'zbirenbaum/copilot.lua',
    cmd = 'Copilot',
    build = ':Copilot auth',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup {
        suggestion = {
          enabled = false,
          -- enabled = true,
          -- auto_trigger = true,
          -- keymap = {
          --     accept = "<Tab>",
          -- },
        },
        panel = {
          enabled = false,
          -- keymap = {
          --     accept = "<CR>",
          --     open = "<C-CR>",
          -- },
          -- layout = {
          --     position = "bottom"
          -- }
        },
        -- filetypes = {
        --   markdown = true,
        --   help = true,
        -- },
      }
    end,
  },
  {
    'zbirenbaum/copilot-cmp',
    config = function()
      require('copilot_cmp').setup()
    end,
  },
}
