--=============================================================================
-- Neovim Nightly Edtion (version 0.8)
-- Lua configuration: init file
--=============================================================================

require "user.settings"
require "user.autocommands"
require "user.keymaps"
require "user.plugins"

require "plugins.toggleterm"
require "plugins.lualine"
require "plugins.gitsigns"
require "plugins.indentblankline"
require "plugins.treesitter"
require "plugins.telescope"

require "plugins.lsp"
