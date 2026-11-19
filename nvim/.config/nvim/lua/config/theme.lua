-- Change only this line
local colorscheme = "solarized-osaka-vivid"

local ok = pcall(vim.cmd.colorscheme, colorscheme)
if not ok then
  vim.notify("Colorscheme '" .. colorscheme .. "' not found, using habamax", vim.log.levels.WARN)
  vim.cmd.colorscheme("habamax")
end
