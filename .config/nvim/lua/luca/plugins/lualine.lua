local status, lualine = pcall(require, "lualine")
if not status then
  return
end

-- get lualine nightfly theme
local lualine_nightfly = require("lualine.themes.gruvbox_dark")

-- configure lualine with modified theme
lualine.setup()
