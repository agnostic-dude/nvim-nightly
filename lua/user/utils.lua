--=============================================================================
-- Neovim Nightly Edtion (version 0.8)
-- Utility functions to be used by other configs
--=============================================================================
local M = {}

--> TODO: Nightfox colorscheme is highly customizable. I need to lookup options
--> for customization and think about using them. But, they are not used here.
--> [ dawnfox, dayfox, duskfox, nightfox, nordfox, terafox ]

local colorschemes = {
  "PaperColor",
  "sonokai",
  "molokai",
  "tokyonight",
  "onedark",
  "codedark",
}

function M.GetRandomTheme()
  math.randomseed(os.time())
  local randnum = math.random(#colorschemes)
  return colorschemes[randnum]
end

return M
