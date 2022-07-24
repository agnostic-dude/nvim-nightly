--=============================================================================
-- Neovim Nightly Edtion (version 0.8)
-- Launch builtin LSP
--=============================================================================
local nvim_lsp = require "lspconfig"

-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

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

for _, server in ipairs(servers) do
    nvim_lsp[server].setup {
      on_attach = on_attach,
      flags = lsp_flags,
      settings = get_settings(server),
    }
end

-- -- NOTE: Uncomment below block and comment out above block to use coq_nvim
-- -- instead of nvim-cmp for autocompletion
-- for _, server in ipairs(servers) do
--   if server == "sumneko_lua" then
--     nvim_lsp.sumneko_lua.setup {
--       require("coq").lsp_ensure_capabilites({
--       on_attach = on_attach,
--       flags = lsp_flags,

--       settings = {
--         Lua = {
--           diagnostics = {
--             globals = { "vim" },
--           },
--         },
--       },
--       })
--     }

--   else
--     nvim_lsp[server].setup {
--       require("coq").lsp_ensure_capabilites({
--       on_attach = on_attach,
--       flags = lsp_flags,
--       })
--     }
--   end
-- end
-------------------------------------------------------------------------------
-- Configure LSP diagnostics
-------------------------------------------------------------------------------
local signs = { Error = "", Warn = "", Info = "", Hint = "" }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
