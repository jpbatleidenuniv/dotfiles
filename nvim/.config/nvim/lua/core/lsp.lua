return {
  "neovim/nvim-lspconfig", -- Get defaults from nvim-lspconfig

  vim.lsp.enable("lua_ls"),
  vim.lsp.enable("basedpyright"),
  vim.lsp.enable("ruff")
}
