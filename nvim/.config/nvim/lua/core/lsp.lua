return {
  vim.lsp.enable("lua_ls"),
  vim.lsp.enable("pyrefly"),
  vim.lsp.enable("ruff"),
  vim.lsp.enable("clangd"),
  vim.lsp.log.set_level(vim.log.levels.OFF)
}
