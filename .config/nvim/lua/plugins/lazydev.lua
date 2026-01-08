-- Auto-completion for LUA configuration for nvim and support for that (it also removes warnings to not found nvim)
return {
  "folke/lazydev.nvim",
  ft = "lua", -- only load on lua files
  opts = {
    library = {
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
    },
  },
}

