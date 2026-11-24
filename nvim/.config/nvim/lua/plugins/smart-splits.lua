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

      vim.keymap.set('n', '<C-h>', ss.move_cursor_left)
      vim.keymap.set('n', '<C-j>', ss.move_cursor_down)
      vim.keymap.set('n', '<C-k>', ss.move_cursor_up)
      vim.keymap.set('n', '<C-l>', ss.move_cursor_right)

      vim.keymap.set('n', '<C-Left>', ss.resize_left)
      vim.keymap.set('n', '<C-Down>', ss.resize_down)
      vim.keymap.set('n', '<C-Up>', ss.resize_up)
      vim.keymap.set('n', '<C-Right>', ss.resize_right)
    end,
  },
}
