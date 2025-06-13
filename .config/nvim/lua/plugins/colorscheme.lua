return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000,
    -- It executes the config function only once the plugin is ready (installed)
    config = function()
      vim.o.background = "dark" -- or "light" for light mode
      vim.cmd([[colorscheme gruvbox]])
    end, 
  }
}
