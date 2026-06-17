return {
  {
    "saghen/blink.cmp",
    version = "*",        -- or pin to a known working tag if you hit breaking changes. :contentReference[oaicite:1]{index=1}
    dependencies = {
      "L3MON4D3/LuaSnip", -- for snippets
      -- optionally: "saghen/blink.compat" if you’ll reuse nvim-cmp sources. :contentReference[oaicite:2]{index=2}
    },
    event = "InsertEnter",
    config = function()
      require("blink.cmp").setup({
        keymap = {
          preset = "none",
          ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
          ['<C-e>'] = { 'hide', 'fallback' },
          ['<C-y>'] = { 'select_and_accept', 'fallback' },

          ['<Up>'] = { 'select_prev', 'fallback' },
          ['<Down>'] = { 'select_next', 'fallback' },
          ['<C-p>'] = { 'select_prev', 'fallback_to_mappings' },
          ['<C-n>'] = { 'select_next', 'fallback_to_mappings' },

          ['<C-b>'] = { 'scroll_documentation_up', 'fallback' },
          ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },

          ['<Tab>'] = { 'snippet_forward', 'fallback' },
          ['<S-Tab>'] = { 'snippet_backward', 'fallback' },

          ['<C-k>'] = { 'show_signature', 'hide_signature', 'fallback' },
        },

        appearance = {
          use_nvim_cmp_as_default = false,
          nerd_font_variant = "mono",
          kind_icons = {
            Text = "",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "󰇽",
            Variable = "󰂡",
            Class = "󰠱",
            Interface = "",
            Module = "",
            Property = "󰜢",
            Unit = "",
            Value = "󰎠",
            Enum = "",
            Keyword = "󰌋",
            Snippet = "",
            Color = "󰏘",
            File = "󰈙",
            Reference = "󰈇",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "󰏿",
            Struct = "",
            Event = "",
            Operator = "󰆕",
          },
        },

        completion = {
          accept = {
            auto_brackets = { enabled = true },
            resolve_timeout_ms = 500,
          },
          list = {
            selection = { preselect = true, auto_insert = false },
          },
          menu = {
            border = "single", -- “squared” look via single border
            max_height = 15,
            scrollbar = true,
            winhighlight = "Normal:CmpNormal,FloatBorder:CmpBorder,CursorLine:PmenuSel",
          },
          documentation = {
            auto_show = true,
            auto_show_delay_ms = 150,
            window = {
              border = "single",
              winhighlight = "Normal:CmpDoc,FloatBorder:CmpBorderDoc",
            },
          },
        },

        signature = {
          enabled = true,
          window = {
            border = "single",
            winhighlight = "Normal:CmpSig,FloatBorder:CmpBorderSig",
          },
        },

        sources = {
          default = { "lsp", "path", "buffer", "snippets" },
          providers = {
            lsp = { name = "LSP", score_offset = 100 },
            path = { name = "Path", score_offset = 40 },
            buffer = { name = "Buffer", score_offset = 30 },
            snippets = { name = "Snip", score_offset = 90 },
          },
        },
      })
    end,
  }
}
