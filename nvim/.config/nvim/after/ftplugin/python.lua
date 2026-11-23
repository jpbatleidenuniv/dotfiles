-- Running files (Only works when using TMUX)
-- Python
vim.keymap.set('n', '<leader>rp', function()
  vim.cmd('w') -- Save the file
  local file = vim.fn.expand('%')
  local cmd = string.format("tmux send-keys -t 2 'clear; uv run %s' C-m", file)
  vim.fn.system(cmd)
  print("▶ Running: uv run " .. file)
end, { desc = "Save and run Python file in tmux right pane" })

vim.g.python3_host_prog = vim.fn.expand("~/.local/share/nvim/python-host/bin/python")
