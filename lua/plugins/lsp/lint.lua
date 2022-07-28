--=============================================================================
-- Neovim Nightly Edtion (version 0.8)
-- nvim-lint configuration
--=============================================================================
local lint = require "lint"

lint.linters_by_ft = {
  sh = { "shellcheck" },
}

vim.api.nvim_create_autocmd(
  { "BufWritePost" }, {
  callback = function()
    lint.try_lint()
  end,
})
