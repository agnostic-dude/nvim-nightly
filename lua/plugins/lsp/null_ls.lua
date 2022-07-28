--=============================================================================
-- Neovim Nightly Edtion (version 0.8)
-- LSP configuration: null-ls configuration
--=============================================================================
local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
  error("null-ls import failed", 2)
  return
end

local formatting = null_ls.builtins.formatting

null_ls.setup {
  debug = false,
  sources = {
    formatting.black.with({ extra_args = { "--fast" } }),
  },
}
