--=============================================================================
-- Neovim Nightly Edtion (version 0.8)
-- LSP configuration: init
--=============================================================================

local nvim_lsp = require "lspconfig"

local on_attach = require("plugins.lsp.keymaps").on_attach
local lsp_flags = {
  debounce_text_changes = 150, --> default
}

local servers = {
  "pyright",
  "sumneko_lua",
  "clangd",
  "tsserver",
}

for _, server in ipairs(servers) do
  if server == "sumneko_lua" then
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

  else
    nvim_lsp[server].setup {
      on_attach = on_attach,
      flags = lsp_flags,
    }
  end
end
