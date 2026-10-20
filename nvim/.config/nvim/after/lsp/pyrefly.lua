return {
  config = function()
    -- 1. Grab the capabilities from blink.cmp
    local blink_caps = require('blink.cmp').get_lsp_capabilities()
    -- 2. Apply them to your native LSP configurations
    vim.lsp.config('pyrefly', {
      capabilities = blink_caps,

    })
  end,
}
