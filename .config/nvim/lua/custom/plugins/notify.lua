return {
  {
    'rcarriga/nvim-notify',
    config = function()
      pcall(require('telescope').load_extension, 'fzf')
      require('notify').setup {
        stages = 'fade',
        timeout = 50,
        background_colour = '#000000',
        icons = {
          ERROR = '',
          WARN = '',
          INFO = '',
          DEBUG = '',
          TRACE = '✎',
        },
      }
      vim.notify = require 'notify'
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
