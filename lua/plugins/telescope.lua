--=============================================================================
-- Neovim Nightly Edtion (version 0.8)
-- Telescope configuration
--=============================================================================
local telescope = require "telescope"
telescope.setup {
  defaults = {
    mappings = {
      i = {
        -- map actions.which_key to to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker
        ["<C-h>"] = "which_key",

        -- <Esc> enters NORMAL mode by default, <Esc> twice to close window
        -- by default <C-c> closes floating window, following code make <Esc>
        -- close the floating window
        -- ["<Esc>"] = require("telescope.actions").close,
      }
    }
  },

  pickers = {
    -- default config for builtin packers goes here
    -- picker_name = {
    --   picker_config_key = value,
    -- }
    -- now picker_config_key will be applied everytime you call this builtin
    -- picker
  },

  extensions = {
    --> native telescope sorter to improve sorting performance
    fzy_native = {
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}

-- Get fzf loaded and working with telescope
telescope.load_extension("fzy_native")
