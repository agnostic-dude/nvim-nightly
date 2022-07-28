--=============================================================================
-- Neovim Nightly Edtion (version 0.8)
-- Configure LSP diagnostics
--=============================================================================
-- Change the symbols that appear on signcolumn
local signs = { Error = "", Warn = "⚠", Info = "", Hint = "" } --> warn =""
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
