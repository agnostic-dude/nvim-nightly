--=============================================================================
-- Neovim Nightly Edtion (version 0.8)
-- Lua configuration: settings
--=============================================================================

-- Whitespace settings
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 2 --> -1 for same value as "shiftwidth", 0 for "tabstop"
vim.opt.shiftwidth = 2 --> 0 for same value as "tabstop"
vim.opt.smarttab = true

-- Indentation
vim.opt.autoindent = true
vim.opt.smartindent = false
vim.opt.cindent = true
vim.opt.breakindent = true

-- Text dispaly area setup
vim.opt.textwidth = 79 --> maximum line length
vim.opt.wrapmargin = 0 --> chars to left of border when wrapping starts
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = '+1'

-- Show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Search settings
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Show effects of command incrementally
vim.opt.inccommand = 'nosplit'
vim.opt.incsearch = true

-- Save undo history
vim.opt.undofile = true

-- Graphical
vim.g.mouse = 'a'
vim.opt.digraph = true
vim.opt.cursorline = true --> highlight the line cursor is on

-- Don't save when switching buffers (this is the default)
vim.opt.hidden = true

-- For Treesitter
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

vim.opt.completeopt = { "menu", "menuone", "noselect" }
vim.opt.dictionary = '/usr/share/dict/allwords.txt'
vim.opt.cmdheight = 2

-- Make new splits appear below and to the right of current one
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Setup path of python3 executable to work with virtual environments
if vim.env.VIRTUAL_ENV ~= nil then
  vim.g.python3_host_prog = vim.env.VIRTUAL_ENV .. "/bin/python3"
else
  vim.g.python3_host_prog = '/usr/bin/python3'
end

-- Set random theme
local utils = require("user.utils")
vim.cmd("colorscheme " .. utils.GetRandomTheme())
