return {
  -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 }
  -- {
  -- 	"folke/tokyonight.nvim",
  -- 	lazy = false,
  -- 	priority = 1000,
  -- 	opts = {},
  -- 	config = function()
  --      require("tokyonight").setup({
  --        style = "night",
  --        transparent = true,
  --      })
  -- 	  vim.cmd.colorscheme("tokyonight-night")
  -- 	end
  -- },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        styles = {
          bold = true,
          italic = false,
          transparency = false,
        }
      })
      vim.cmd("colorscheme rose-pine")
    end
  }
}
