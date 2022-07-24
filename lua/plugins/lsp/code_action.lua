--=============================================================================
-- Show a sign when a code action is available.
--=============================================================================
local M = {}

function M.code_action_listener()
  local context = { diagnostics = vim.lsp.diagnostic.get_line_diagnostics() }
  local params = vim.lsp.util.make_range_params()
  params.context = context
  vim.lsp.buf.request(0, "textDocument/codeAction", params, function(err, _, result)
    --> do something with result - eg. check if empty & show some indication
    --> such as as sign
  end)
end

return M
