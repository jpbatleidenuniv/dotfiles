return {
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
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
  },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  }
}
