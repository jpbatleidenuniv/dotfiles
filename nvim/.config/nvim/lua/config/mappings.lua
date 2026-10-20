--[[
----------------------------------------------
    __ __
   / //_/__  __  ______ ___  ____ _____  _____
  / ,< / _ \/ / / / __ `__ \/ __ `/ __ \/ ___/
 / /| /  __/ /_/ / / / / / / /_/ / /_/ (__  )
/_/ |_\___/\__, /_/ /_/ /_/\__,_/ .___/____/
          /____/               /_/
----------------------------------------------
--]]
-- Some more general keymaps, entering netrw and no highlight on search.
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Go to file menu." })
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("n", "<M-q>", "<cmd>bd<CR>")
vim.keymap.set("i", "jj", "<Esc>")
vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set({ 'n', 'x' }, '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
vim.keymap.set({ 'n', 'x' }, '<leader>Y', '"+yg_', { desc = 'Copy to system clipboard' })
vim.keymap.set({ 'n', 'x' }, '<leader>p', '"+p', { desc = 'Paste from system clipboard' })
vim.keymap.set({ 'n', 'x' }, '<leader>P', '"+P', { desc = 'Paste from system clipboard' })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Also disable arrow keys in insert mode
vim.keymap.set("i", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("i", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("i", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("i", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Make navigation a bit easier
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" }) --  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
vim.keymap.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })

-- Diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Show diagnostics in float" })
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next diagnostic" })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })

-- Running files (Only works when using TMUX)
-- Python
vim.keymap.set('n', '<leader>r', function()
  vim.cmd('w') -- Save the file
  local file = vim.fn.expand('%')
  local cmd = string.format("tmux send-keys -t 2 'clear; uv run %s' C-m", file)
  vim.fn.system(cmd)
  print("▶ Running: uv run " .. file)
end, { desc = "Save and run Python file in tmux right pane" })

-- Running Python modules (Only works when using TMUX)
vim.keymap.set('n', '<leader>m', function()
  vim.cmd('w') -- Save the file
  local file = vim.fn.expand('%')
  local no_ext = vim.fn.fnamemodify(file, ':r')
  local module_path = no_ext:gsub('/', '.')
  local cmd = string.format("tmux send-keys -t 2 'clear; uv run -m %s' C-m", module_path)
  vim.fn.system(cmd)
  print("▶ Running module: uv run -m " .. module_path)
end, { desc = "Save and run Python module in tmux right pane" })

vim.keymap.set("n", "<leader>c", function()
  vim.cmd("w")
  local file = vim.fn.expand('%')
  local bin = vim.fn.fnamemodify(file, ':r') .. ".out"
  local cmd = string.format("tmux send-keys -t 2 'clear; gcc %s -o %s; ./%s' C-m", file, bin, bin)
  vim.fn.system(cmd)
  print("▶ Compiling and running:" .. file)
end, { desc = "Save, compile and run a .c file in tmux right pane." })
