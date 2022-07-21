--=============================================================================
-- Neovim Nightly Edtion (version 0.8)
-- LSP configuration: init
--=============================================================================

local nvim_lsp = require "lspconfig"

local on_attach = require("plugins.lsp.keymaps").on_attach
local lsp_flags = {
  debounce_text_changes = 150, --> default
}

nvim_lsp.pyright.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  flags = lsp_flags,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    }
  }
}
