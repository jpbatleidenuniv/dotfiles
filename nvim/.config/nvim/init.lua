require("config.mappings")
require("config.autocommands")
require("config.options")
vim.g.maplocalleader = "\\"
vim.g.have_nerd_font = true -- Set to true if you have a Nerd Font installed and selected in the terminal

-- Lazy
require("config.lazy")
