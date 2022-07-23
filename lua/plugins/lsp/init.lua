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
  "pyright",          --> python
  "sumneko_lua",      --> lua
  "clangd",           --> C, C++, Objective-C
  "tsserver",         --> typescript, javascript
  "bashls",           --> bash, zsh
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

-------------------------------------------------------------------------------
-- Configure LSP diagnostics
-------------------------------------------------------------------------------
local signs = { Error = "", Warn = "", Info = "", Hint = "" }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
