-- Running files (Only works when using TMUX)
-- Python
vim.keymap.set('n', '<localleader>rp', function()
  vim.cmd('w') -- Save the file
  local file = vim.fn.expand('%')
  local cmd = string.format("tmux send-keys -t 2 'clear; uv run %s' C-m", file)
  vim.fn.system(cmd)
  print("▶ Running: uv run " .. file)
end, { desc = "Save and run Python file in tmux right pane" })

-- Molten
vim.keymap.set("n", "<localleader>mi", ":MoltenInit<CR>", { silent = true, desc = "Initialize the plugin" })
vim.keymap.set("n", "<localleader>e", ":MoltenEvaluateOperator<CR>", { silent = true, desc = "run operator selection" })
vim.keymap.set("n", "<localleader>rl", ":MoltenEvaluateLine<CR>", { silent = true, desc = "evaluate line" })
vim.keymap.set("n", "<localleader>rr", ":MoltenReevaluateCell<CR>", { silent = true, desc = "re-evaluate cell" })
vim.keymap.set("v", "<localleader>r", ":<C-u>MoltenEvaluateVisual<CR>gv",
  { silent = true, desc = "evaluate visual selection" })
vim.keymap.set("n", "<localleader>rd", ":MoltenDelete<CR>", { silent = true, desc = "molten delete cell" })
vim.keymap.set("n", "<localleader>oh", ":MoltenHideOutput<CR>", { silent = true, desc = "hide output" })
vim.keymap.set("n", "<localleader>os", ":noautocmd MoltenEnterOutput<CR>", { silent = true, desc = "show/enter output" })
