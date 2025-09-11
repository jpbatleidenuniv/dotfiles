return {
  {
	  'nvim-mini/mini.nvim',
	  version = false,
	  config = function()
		  local icons = require 'mini.icons'
		  icons.setup {style = 'glyph', use_file_extension = function(ext, file) return true end}
	  end
  }
}
