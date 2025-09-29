return {
  'alexghergh/nvim-tmux-navigation',
  config = function()
    local nvim_tmux_nav = require 'nvim-tmux-navigation'

    nvim_tmux_nav.setup {
      disable_when_zoomed = true, -- defaults to false
    }

    vim.keymap.set('n', '<M-left>', nvim_tmux_nav.NvimTmuxNavigateLeft)
    vim.keymap.set('n', '<M-down>', nvim_tmux_nav.NvimTmuxNavigateDown)
    vim.keymap.set('n', '<M-up>', nvim_tmux_nav.NvimTmuxNavigateUp)
    vim.keymap.set('n', '<M-right>', nvim_tmux_nav.NvimTmuxNavigateRight)
    vim.keymap.set('n', '<M-\\>', nvim_tmux_nav.NvimTmuxNavigateLastActive)
    vim.keymap.set('n', '<M-Space>', nvim_tmux_nav.NvimTmuxNavigateNext)
  end,
}
