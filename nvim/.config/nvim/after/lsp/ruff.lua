return {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
  settings = {},

  on_attach = function(client, bufnr)
    -- Let Ruff handle formatting
    client.server_capabilities.documentFormattingProvider = true
    client.server_capabilities.documentRangeFormattingProvider = true

    -- Disable hover so Pyright handles it
    client.server_capabilities.hoverProvider = false

    vim.keymap.set("n", "<leader>gW", function()
      vim.lsp.buf.format({ async = true })
    end, { buffer = bufnr, desc = "Format with Ruff" })
  end,
}
