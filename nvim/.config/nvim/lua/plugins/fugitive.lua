return {
  {
    "tpope/vim-fugitive",
    cmd = { "Git", "G" },
    config = function()
      -- Optional: map to open status window quickly
      vim.api.nvim_set_keymap("n", "gs", ":Gstatus", { noremap = true, silent = true })
    end
  }
}
