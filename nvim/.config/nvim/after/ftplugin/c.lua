vim.keymap.set("n", "<leader>c", function()
  vim.cmd("w")
  local file = vim.fn.expand('%')
  local bin = vim.fn.fnamemodify(file, ':r') .. ".out"
  local cmd = string.format("tmux send-keys -t 2 'clear; gcc %s -o %s; ./%s' C-m", file, bin, bin)
  vim.fn.system(cmd)
  print("▶ Compiling and running:" .. file)
end, { desc = "Save, compile and run a .c file in tmux right pane." })
