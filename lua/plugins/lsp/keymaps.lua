--=============================================================================
-- Neovim Nightly Edtion (version 0.8)
-- LSP configuration: keymaps
-- Keymaps for working with builtin LSP
--=============================================================================
local M = {}

-- Map following keys only when language server attaches to current buffer
-- On_attach function to pass on to lspconfig setup()
function M.on_attach(client, bufnr)

  -- Enable <C-x><C-o> triggered OMNICOMPLETION
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local function nnoremap(lhs, rhs)
    local opts = { noremap = true, silent = true }
    vim.keymap.set("n", lhs, rhs, opts)
  end

  local function buf_noremap(mode, lhs, rhs)
    local buf_opts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set(mode, lhs, rhs, buf_opts)
  end

  -- Keymappings (look up ":h vim.lsp.*" for documentation on any of following)
  nnoremap("<Leader>do", vim.diagnostic.open_float) --> diagnostics in floating window
  nnoremap("<Leader>dp", vim.diagnostic.goto_prev)
  nnoremap("<Leader>dn", vim.diagnostic.goto_next)
  nnoremap("<Leader>dl", "<cmd>Telescope diagnostics<cr>") --> <C-q> to put these into quickfix list

  buf_noremap("n", "K", vim.lsp.buf.hover)
  buf_noremap("n", "gd", vim.lsp.buf.definition)
  buf_noremap("n", "gt", vim.lsp.buf.type_definition)
  buf_noremap("n", "gi", vim.lsp.buf.implementation)
  buf_noremap("n", "gD", vim.lsp.buf.declaration)
  buf_noremap("n", "gr", vim.lsp.buf.references)

  buf_noremap("n", "<Leader>rn", vim.lsp.buf.rename)

  buf_noremap("n", "<Leader>ca", vim.lsp.buf.code_action)
  buf_noremap("v", "<Leader>ca", vim.lsp.buf.range_code_action)

  buf_noremap("n", "<Leader>fx", vim.lsp.buf.format)
  buf_noremap("x", "<Leader>fx", vim.lsp.buf.range_formatting)

end

return M
