return {
  {
    "christoomey/vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<a-h>", "<cmd>TmuxNavigateLeft<cr>" },
      { "<a-j>", "<cmd>TmuxNavigateDown<cr>" },
      { "<a-k>", "<cmd>TmuxNavigateUp<cr>" },
      { "<a-l>", "<cmd>TmuxNavigateRight<cr>" },
      { "<a-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
    },
  }
--    {
--    'alexghergh/nvim-tmux-navigation',
--    config = function()
--      local nvim_tmux_nav = require('nvim-tmux-navigation')
--      nvim_tmux_nav.setup {
--          disable_when_zoomed = true -- defaults to false
--      }
--      vim.keymap.set({ 'n', 't' }, "<A-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
--      vim.keymap.set({ 'n', 't' }, "<A-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
--      vim.keymap.set({ 'n', 't' }, "<A-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
--      vim.keymap.set({ 'n', 't' }, "<A-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
--      vim.keymap.set({ 'n', 't' }, "<A-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
--      vim.keymap.set({ 'n', 't' }, "<A-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
--    end
--  }
}
