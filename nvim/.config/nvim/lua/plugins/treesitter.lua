return {
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main',
    lazy = false,
    build = ':TSUpdate',
    config = function()
      require('nvim-treesitter').install({
        'python', 'lua', 'vim', 'vimdoc', 'query', 'markdown',
        'markdown_inline', 'yaml', 'toml', 'css', 'html', 'c',
      })

      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          pcall(vim.treesitter.start, args.buf) -- no-op if no parser exists
        end,
      })
    end,
  }
}
