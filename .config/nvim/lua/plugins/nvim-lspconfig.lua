-- It provides basic, default Nvim LSP client configurations for various LSP servers.
return {
  "neovim/nvim-lspconfig",
  
  config = function ()
    
    local lspconfig = require("lspconfig")
    lspconfig.clangd.setup({})

  end,
}
