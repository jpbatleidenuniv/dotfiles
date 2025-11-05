return {
  {
    'stevearc/conform.nvim',
    opts = {
      python = {'ruff'},
      format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
      },
    },
  }
}
