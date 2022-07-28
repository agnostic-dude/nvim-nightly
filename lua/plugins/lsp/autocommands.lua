--=============================================================================
-- Neovim Nightly Edtion (version 0.8)
-- LSP configuration: autocommands
--=============================================================================
-- Show code actions when available
local code_action_utils = require "plugins.lsp.code_action"

vim.api.nvim_create_autocmd(
  { "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = function()
    code_action_utils.code_action_listener()
  end,
  group = vim.api.nvim_create_augroup("ShowCodeAction", { clear = true }),
})

-- Format file on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
  group = vim.api.nvim_create_augroup("FormatOnSave", { clear = true }),
})

-- vim.cmd [[ autocmd BufWritePre <buffer> lua vim.lsp.buf.format() ]]
