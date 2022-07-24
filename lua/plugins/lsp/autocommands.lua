-- require "plugins.lsp.code_action"

local code_action_utils = require("plugins.lsp.code_action")
local code_action = vim.api.nvim_create_augroup("CodeAction", { clear = true })
vim.api.nvim_create_autocmd(
  { "CursorHold", "CursorHoldI" }, {
  pattern = "*",
  callback = code_action_utils.code_action_listener,
  group = code_action,
}
)
