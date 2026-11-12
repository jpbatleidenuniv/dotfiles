return {
  cmd = { 'ruff', 'server' },
  filetypes = { 'python' },
  root_markers = { 'pyproject.toml', 'ruff.toml', '.ruff.toml', '.git' },
  settings = {},

  -- Pin the encoding so it matches pyrefly (see below for which value)
  capabilities = {
    general = { positionEncodings = { 'utf-16' } },
  },

  on_attach = function(client, bufnr)
    -- Pyrefly handles hover, Ruff handles formatting/linting
    client.server_capabilities.hoverProvider = false

    vim.keymap.set('n', '<leader>gW', function()
      vim.lsp.buf.format({
        async = true,
        filter = function(c) return c.name == 'ruff' end,
      })
    end, { buffer = bufnr, desc = 'Format with Ruff' })
  end,
}
