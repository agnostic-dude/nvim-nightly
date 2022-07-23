--==============================================================================
-- Neovim Nightly Edtion (version 0.8)
-- Lua configuration: autocommands
--==============================================================================
-- Since neovim v0.7 API autocommands can be written in Lua


-------------------------------------------------------------------------------
--                  Mapping ESCAPE key to CAPSLOCK
-------------------------------------------------------------------------------
-- Map <Escape> key to <CapsLock> for easy typing (using xmodmap)
-- CAUTION: If >= 2 buffers are open, exiting from one buffer alone undoes this
-- mapping. You also will not have the use of Caps-Lock key!
--
-- Entering neovim: CapsLock Key ==> Escape Function
vim.api.nvim_create_autocmd("VimEnter", {
  pattern = "*",
  command = "silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Escape'",
})

-- Exiting neovim: CapsLock Key ==> CapsLock Function
vim.api.nvim_create_autocmd("VimLeave", {
  pattern = "*",
  command = "silent! !xmodmap -e 'clear Lock' -e 'keycode 0x42 = Caps_Lock'",
})

-------------------------------------------------------------------------------
--                      Redundant WHITESPACE
-------------------------------------------------------------------------------
-- Remove redundant whitespace at end-of-line, redundant newlines at end-of-file
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  command = "autocmd BufWritePre <buffer> %s/\\s\\+$//e"
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  command = "autocmd BufWritePre <buffer> %s/\\($\\n\\s*\\)\\+\\%$//e"
})

-------------------------------------------------------------------------------
--                        LINE NUMBERS
-------------------------------------------------------------------------------
-- Toggle/untoggle relative/absolute line numbers depending on active/inactive
-- state of the buffers.
local numbertoggle = vim.api.nvim_create_augroup("numbertoggle", { clear = true })

-- relative line numbers in active buffer
vim.api.nvim_create_autocmd(
  { "BufEnter", "FocusGained", "InsertLeave" },
  { pattern = "*", command = "set relativenumber", group = numbertoggle }
)

-- absolute line numbers in inactive buffer
vim.api.nvim_create_autocmd(
  { "BufLeave", "FocusLost", "InsertEnter" },
  { pattern = "*", command = "set norelativenumber", group = numbertoggle }
)

-------------------------------------------------------------------------------
--                        Custom AUTO-PAIRS
-------------------------------------------------------------------------------
-- Make AutoPairs understand python F-strings & byte strings
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  command = [[ let b:AutoPairs = AutoPairsDefine({ "f'": "'", "b'": "'" }) ]]
})

-- Make AutoPairs understand markup language angle brackets
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "html", "xml" },
  command = [[  let b:AutoPairs = AutoPairsDefine({ '<': '>' }) ]]
})

-- Auto-complete HTML tags with omnicomplete
vim.api.nvim_create_autocmd("FileType", {
  pattern = "html",
  command = "inoremap </ </<C-x><C-o>"
})
