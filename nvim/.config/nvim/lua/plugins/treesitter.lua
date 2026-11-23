-- lua/plugins/treesitter.lua
return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    opts = {},
    config = function(_, opts)
      require("nvim-treesitter").setup(opts)

      require("nvim-treesitter").install({
        "python", "lua", "vim", "markdown", "markdown_inline",
        "yaml", "toml", "css", "html", "c",
      })

      -- quarto files use the markdown parser
      vim.treesitter.language.register("markdown", "quarto")

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
          pcall(vim.treesitter.start, args.buf) -- no-op if no parser exists
        end,
      })
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
      select = { lookahead = true },
      move = { set_jumps = false },
    },
    keys = {
      -- select
      {
        "ib",
        mode = { "x", "o" },
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@code_cell.inner", "textobjects")
        end,
        desc = "in block"
      },
      {
        "ab",
        mode = { "x", "o" },
        function()
          require("nvim-treesitter-textobjects.select").select_textobject("@code_cell.outer", "textobjects")
        end,
        desc = "around block"
      },

      -- move
      {
        "]b",
        mode = { "n", "x", "o" },
        function()
          require("nvim-treesitter-textobjects.move").goto_next_start("@code_cell.inner", "textobjects")
        end,
        desc = "next code block"
      },
      {
        "[b",
        mode = { "n", "x", "o" },
        function()
          require("nvim-treesitter-textobjects.move").goto_previous_start("@code_cell.inner", "textobjects")
        end,
        desc = "previous code block"
      },

      -- swap
      {
        "<leader>sbl",
        function()
          require("nvim-treesitter-textobjects.swap").swap_next("@code_cell.outer")
        end,
        desc = "swap block next"
      },
      {
        "<leader>sbh",
        function()
          require("nvim-treesitter-textobjects.swap").swap_previous("@code_cell.outer")
        end,
        desc = "swap block previous"
      },
    },
  },
}
