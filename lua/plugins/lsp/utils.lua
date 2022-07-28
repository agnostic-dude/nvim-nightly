--=============================================================================
-- Neovim Nightly Edtion (version 0.8)
-- LSP configuration: keymaps
-- Keymaps for working with builtin LSP
--=============================================================================
local M = {}

-- set keymappings in NORMAL mode
local function nnoremap(lhs, rhs)
  local opts = { noremap = true, silent = true }
  vim.keymap.set("n", lhs, rhs, opts)
end

-- set keymappings in ANY mode for GIVEN buffer
local function buf_noremap(mode, lhs, rhs, bufnr)
  local buf_opts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set(mode, lhs, rhs, buf_opts)
end

-- Format files on save
local function lsp_formatting(bufnr)
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "null_ls"
    end,
    bufnr = bufnr,
  })
end

-- Map following keys only when language server attaches to current buffer
-- On_attach function to pass on to lspconfig setup()
function M.on_attach(client, bufnr)

  -- Keybindings
  -- Enable <C-x><C-o> triggered OMNICOMPLETION
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- :help vim.lsp.*
  nnoremap("<Leader>do", vim.diagnostic.open_float) --> launch floating window
  nnoremap("<Leader>dp", vim.diagnostic.goto_prev)
  nnoremap("<Leader>dn", vim.diagnostic.goto_next)
  nnoremap("<Leader>dl", "<cmd>Telescope diagnostics<cr>") --> <C-q> quickfix list

  -- Inspect source code
  buf_noremap("n", "K", vim.lsp.buf.hover)
  buf_noremap("n", "gd", vim.lsp.buf.definition)
  buf_noremap("n", "gt", vim.lsp.buf.type_definition)
  buf_noremap("n", "gi", vim.lsp.buf.implementation)
  buf_noremap("n", "gD", vim.lsp.buf.declaration)
  buf_noremap("n", "gr", vim.lsp.buf.references)

  -- Rename identifiers
  buf_noremap("n", "<Leader>rn", vim.lsp.buf.rename)

  -- Perform actions on file/region
  buf_noremap("n", "<Leader>ca", vim.lsp.buf.code_action)
  buf_noremap("v", "<Leader>ca", vim.lsp.buf.range_code_action)

  -- Format text in a file/region
  buf_noremap("n", "<Leader>fx", vim.lsp.buf.format)
  buf_noremap("x", "<Leader>fx", vim.lsp.buf.range_formatting)

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {

      -- Can use this as a callback if want to setup formatting on save
      group = vim.api.nvim_create_augroup("LspBufFormat", { clear = true }),
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end

return M
