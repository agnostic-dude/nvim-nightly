--=============================================================================
-- Neovim Nightly Edtion (version 0.8)
-- LSP configuration: init
--=============================================================================

local nvim_lsp = require "lspconfig"

local on_attach = require("plugins.lsp.keymaps").on_attach
local lsp_flags = {
  debounce_text_changes = 150, --> default
}

-- pyright-langserver : python (pacman -S pyright)
nvim_lsp.pyright.setup {
  on_attach = on_attach,
  flags = lsp_flags,
}

-- lua-language-server: lua (pacman -S lua-language-server)
nvim_lsp.sumneko_lua.setup {
  on_attach = on_attach,
  flags = lsp_flags,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
}

-- clangd: C, C++ (pacman -S clang)
nvim_lsp.clangd.setup {
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
