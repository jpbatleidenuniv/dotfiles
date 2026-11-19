return {
  {
    "benlubas/molten-nvim",
    version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    init = function()
      -- these are examples, not defaults. Please see the readme
      vim.g.molten_image_provider = "image.nvim"
      vim.g.molten_output_win_max_height = 20
      -- I find auto open annoying, keep in mind setting this option will require setting
      -- a keybind for `:noautocmd MoltenEnterOutput` to open the output again
      vim.g.molten_auto_open_output = false
      -- optional, I like wrapping. works for virt text and the output window
      vim.g.molten_wrap_output = true
      -- Output as virtual text. Allows outputs to always be shown, works with images, but can
      -- be buggy with longer images
      vim.g.molten_virt_text_output = true
      -- this will make it so the output shows up below the \`\`\` cell delimiter
      vim.g.molten_virt_lines_off_by_1 = true
    end,
    config = function()
      local map = function(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { silent = true, desc = "Molten: " .. desc })
      end
      map("n", "<leader>je", ":MoltenEvaluateOperator<CR>", "evaluate operator (then a motion, e.g. ip)")
      map("n", "<leader>jo", ":noautocmd MoltenEnterOutput<CR>", "enter output window")
      map("v", "<leader>jv", ":<C-u>MoltenEvaluateVisual<CR>gv", "evaluate selection")
      map("n", "<leader>jc", ":MoltenReevaluateCell<CR>", "re-evaluate cell")
      map("n", "<leader>jj", ":MoltenEvaluateLine<CR>", "evaluate line")
      --   map("n", "<leader>ji", ":MoltenInit<CR>", "init kernel")
      --   map("n", "<leader>jh", ":MoltenHideOutput<CR>", "hide output")
      --   map("n", "<leader>jd", ":MoltenDelete<CR>", "delete cell")
      --   map("n", "<leader>jr", ":MoltenRestart!<CR>", "restart kernel")
      --   map("n", "<leader>jx", ":MoltenInterrupt<CR>", "interrupt kernel")
    end
  },
  {
    -- see the image.nvim readme for more information about configuring this plugin
    "3rd/image.nvim",
    opts = {
      backend = "kitty", -- whatever backend you would like to use
      max_width = 100,
      max_height = 12,
      max_height_window_percentage = math.huge,
      max_width_window_percentage = math.huge,
      window_overlap_clear_enabled = true, -- toggles images when windows are overlapped
      window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
    },
  }
}
