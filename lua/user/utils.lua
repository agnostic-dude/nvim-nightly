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

function M.GetRandomColor()
  local randnum = math.random(#colorschemes)
  return colorschemes[randnum]
end

return M
