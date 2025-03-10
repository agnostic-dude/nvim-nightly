--=============================================================================
-- Neovim Nightly Edtion (version 0.8)
-- toggleterm.nvim: configurations & keymappings
--=============================================================================
-- Scrolling inside toggleterm with vim movement keys
-- Escape (CapsLock) to enter NORMAL mode; then use movement keys j, k, <C-n>,
-- <C-p>, <C-d>, <C-u> to move within the floating terminal
function _G.set_terminal_keymaps()
  local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, "t", "<Esc>", "<C-\\><C-n>", opts)
end
vim.cmd [[ autocmd! TermOpen term://* lua set_terminal_keymaps() ]]

require("toggleterm").setup {
  -- size can be a number or function which is passed the current terminal
  size = 80,
  -- size = 20 | function(term)
  --   if term.direction == "horizontal" then
  --     return 15
  --   elseif term.direction == "vertical" then
  --     return vim.o.columns * 0.4
  --   end
  -- end,

  open_mapping = "<Leader><Space>",
  -- on_open = fun(t: Terminal), -- function to run when the terminal opens
  -- on_close = fun(t: Terminal), -- function to run when the terminal closes
  hide_numbers = true,    -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = 3, --> degree by which to darken to terminal colour,
                       --> default: 1 for dark backgrounds, 3 for light backgrounds
  start_in_insert = true,
  insert_mappings = false, -- open mapping applies in INSERT mode or not
  terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
  persist_size = true,
  direction = 'float',  -- options = 'vertical' | 'horizontal' | 'window' | 'float'
  close_on_exit = true, -- close the terminal window when the process exits
  shell = vim.o.shell,  -- change the default shell

  -- This field is only relevant if direction is set to 'float'
  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    -- border = 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
    border = 'curved',
    width = 160,
    height = 38,
    winblend = 3,
    -- windblend = 30,
    highlights = {
      border = "Normal",
      background = "Normal",
    }
  }
}
