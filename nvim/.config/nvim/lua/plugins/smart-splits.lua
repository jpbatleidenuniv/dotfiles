return {
  {
    'smart-splits-nvim/smart-splits.nvim',
    opts = {
      mux = { backend = 'smart-splits-backend-tmux' },
      move = { at_edge = 'wrap' },
    },
    dependencies = {
      { 'smart-splits-nvim/backend-tmux', main = 'smart-splits-backend-tmux' },
    },
    config = function(_, opts)
      local ss = require('smart-splits')
      ss.setup(opts)

      vim.keymap.set('n', '<C-h>', ss.move_cursor_left, { desc = "Move cursor to left pane" })
      vim.keymap.set('n', '<C-j>', ss.move_cursor_down, { desc = "Move cursor to lower pane" })
      vim.keymap.set('n', '<C-k>', ss.move_cursor_up, { desc = "Move cursor to upper pane" })
      vim.keymap.set('n', '<C-l>', ss.move_cursor_right, { desc = "Move cursor to right pane" })

      vim.keymap.set('n', '<C-Left>', ss.resize_left, { desc = "Resize pane left" })
      vim.keymap.set('n', '<C-Down>', ss.resize_down, { desc = "Resize pane down" })
      vim.keymap.set('n', '<C-Up>', ss.resize_up, { desc = "Resize pane up" })
      vim.keymap.set('n', '<C-Right>', ss.resize_right, { desc = "Resize pane right" })
    end,
  },
}
