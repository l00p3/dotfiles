-- statusline
return {
  {
    "nvim-lualine/lualine.nvim",
    
    config = function()
      local custom_gruvbox = require("lualine.themes.gruvbox_dark")
      -- Change the background of lualine_c section for normal mode
      -- custom_gruvbox.normal.c.bg = "#112233"

      require("lualine").setup {
        options = {
            theme = custom_gruvbox,
            section_separators = { left = "", right = "" },
            component_separators = { left = "", right = "" },
          },
          sections = {
            lualine_a = { "mode" },
            lualine_b = { "branch" },
            lualine_c = { "filename" },
            lualine_x = { "encoding", "fileformat", "filetype" },
            lualine_y = { "progress" },
            lualine_z = { "location" },
          }, 
        }

    end,
  }
}
