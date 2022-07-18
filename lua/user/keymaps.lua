--=============================================================================
-- Neovim Nightly Edtion (version 0.8)
-- Lua configuration: keymappings
--=============================================================================
-- Notes:
-- <CR> = "carriage return"
-- <Cmd> = ":" (same as entering semicolon at the command line)
-------------------------------------------------------------------------------

--> Map "lhs" keystrokes to "rhs" keystrokes, in NORMAL mode with default opts
local function nmap(lhs, rhs)
  vim.keymap.set("n", lhs, rhs)
end

--> Map "lhs" keystrokes to "rhs" keystrokes, in INSERT mode with default opts
local function imap(lhs, rhs)
  vim.keymap.set("i", lhs, rhs)
end

-- LEADER KEY (aka. <Leader>)
vim.g.mapleader = ";"

-- Ctrl-j/k/h/l to navigate between splits
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")
nmap("<C-h>", "<C-w>h")

-- Ctrl-s to save in NORMAL & INSERT modes
nmap("<C-s>", "<Cmd>w<CR>") -- nmap(...)
imap("<C-s>", "<Esc><Cmd>w<CR>a") -- imap(...)

-- Ctrl-q closes current split
nmap("<C-q>", "<C-w>q")

-- Clear highlighted text with <Escape> key
nmap("<ESC>", ":nohlsearch<Bar>:echo<cr>")

-- Captalize previous word in INSERT mode
imap("<C-u>", "<Esc>viwUea")

-- Show current colorscheme (colorscheme show)
nmap("<Leader>cs", "<Cmd>colorscheme<CR>")

-- Go to startify splash screen
nmap("<Leader>a", "<Cmd>Alpha<CR>")

-------------------------------------------------------------------------------
-- COLORSCHEME settings
-------------------------------------------------------------------------------
nmap("<Leader>cn", "<Cmd>CycleColorNext<CR>") --> colorscheme next
nmap("<Leader>cp", "<Cmd>CycleColorPrev<CR>") --> colorscheme previous
nmap("<Leader>bg", "<Cmd>lua print(vim.o.background)<CR>") --> print background hue
nmap("<Leader>bt", "<Cmd>lua BackgroundToggle()<CR>") --> toggle background light<->dark

-------------------------------------------------------------------------------
-- TELESCOPE.NVIM
-------------------------------------------------------------------------------
nmap("<Leader>ff", '<Cmd>lua require("telescope.builtin").find_files()<CR>')
nmap("<Leader>fg", '<Cmd>lua require("telescope.builtin").live_grep()<CR>')
nmap("<Leader>fb", '<Cmd>lua require("telescope.builtin").buffers()<CR>')
nmap("<Leader>fh", '<Cmd>lua require("telescope.builtin").help_tags()<CR>')

-------------------------------------------------------------------------------
-- NVIM-TREE
-------------------------------------------------------------------------------
nmap("<Leader>tt", "<Cmd>NvimTreeToggle<CR>") --> open/close tree
nmap("<Leader>tf", "<Cmd>NvimTreeFocus<CR>") --> open and focus on tree
nmap("<Leader>tc", "<Cmd>NvimTreeCollapse<CR>") --> recursively collapse nvim-tree
