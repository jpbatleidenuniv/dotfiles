--[[
-------------------------------------
   ____        __  _
  / __ \____  / /_(_)___  ____  _____
 / / / / __ \/ __/ / __ \/ __ \/ ___/
/ /_/ / /_/ / /_/ / /_/ / / / (__  )
\____/ .___/\__/_/\____/_/ /_/____/
    /_/
-------------------------------------
--]]
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

vim.o.number = true        -- Make line numbers default
vim.o.relativenumber = true
vim.o.mouse = "a"          -- Enable mouse mode, can be useful for resizing splits for example!
vim.o.breakindent = true   -- Enable break indent
vim.o.undofile = true      -- Save undo history
vim.o.ignorecase = true    -- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.smartcase = true
vim.o.signcolumn = "yes"   -- Keep signcolumn on by default
vim.o.updatetime = 250     -- Decrease update time
vim.o.timeoutlen = 300     -- Decrease mapped sequence wait time
vim.o.splitright = true    -- Configure how new splits should be opened
vim.o.splitbelow = false
vim.o.list = true          -- Display how whitespaces, tabs, and nbspces are displayed
vim.o.inccommand = "split" -- Preview substitutions live, as you type!
vim.o.cursorline = true
vim.o.scrolloff = 50       -- Minimal number of screen lines to keep above and below the cursor.
vim.o.confirm = true       -- Confirm me if I want to save changes or something (like after :q)
vim.o.ts = 4               -- Indent size in spaces.
vim.o.sw = 4               -- Indent size in spaces.
vim.o.clipboard = 'unnamed'
vim.opt.winborder = 'rounded'
