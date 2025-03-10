--=============================================================================
-- Neovim Nightly Edtion (version 0.8)
-- Telescope configuration
--=============================================================================
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        -- map actions.which_key to to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker
        ["<C-h>"] = "which_key",
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
    -- extension_name = {
    --   extension_config_key = value,
    -- }
  }
}
