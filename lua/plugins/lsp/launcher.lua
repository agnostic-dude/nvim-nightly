--=============================================================================
-- Neovim Nightly Edtion (version 0.8)
-- Launch builtin LSP
--=============================================================================
local nvim_lsp = require "lspconfig"
local coq = require "coq"

local on_attach = require("plugins.lsp.keymaps").on_attach
local lsp_flags = {
  debounce_text_changes = 150, --> default
}

local servers = {
  "pyright", --> python
  "sumneko_lua", --> lua
  "clangd", --> C, C++, Objective-C
  "tsserver", --> typescript, javascript
  "bashls", --> bash, zsh
}

-- Settings dictionary modified if server is lua
local function get_settings(server)
  if server == "sumneko_lua" then
    return {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
      },
    }
  end
end

-- Setup coq_nvim autocompletion
for _, server in ipairs(servers) do
  nvim_lsp[server].setup(
    coq.lsp_ensure_capabilities {
      on_attach = on_attach,
      flags = lsp_flags,
      settings = get_settings(server),
    }
  )
end
-------------------------------------------------------------------------------
-- Configure LSP diagnostics
-------------------------------------------------------------------------------
local signs = { Error = "", Warn = "", Info = "", Hint = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
