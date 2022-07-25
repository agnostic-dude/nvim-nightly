local function lsp_formatting(bufnr)
  vim.lsp.buf.format({
    filter = function (client)
      return client.name == "null_ls"
    end,
    bufnr = bufnr,
  })
end

-- Can use this as a callback if want to setup formatting on save
local augroup = vim.api.nvim_create_augroup("LspBufFormatting", { clear = true })

local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function ()
        lsp_formatting(bufnr)
      end,
    })
  end
end

local null_ls = require "null-ls"


null_ls.setup ({
  sources = {
    null_ls.builtins.formatting.black,
  }
})
