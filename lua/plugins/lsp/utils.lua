--=============================================================================
-- Neovim Nightly Edition (version 0.8)
-- LSP configuration: utilites to be used by LSP configs
--=============================================================================

local M = {}

function M.custom_attach(client, bufnr)
  local keymaps = require("plugins.lsp.keymaps").on_attach
  local null_ls = require("plugins.lsp.null_ls").on_attach
end

return M
