return {
  {
    'nvim-mini/mini.nvim',
    version = false,
    config = function()
      require('mini.icons').setup({
        style = 'glyph',
        use_file_extension = function(ext, file)
          return true
        end
      })
      require('mini.ai').setup({})
      require('mini.pairs').setup({})
      require('mini.align').setup({})
    end
  }
}
