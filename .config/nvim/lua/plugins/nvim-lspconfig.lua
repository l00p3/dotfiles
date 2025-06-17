-- It provides basic, default Nvim LSP client configurations for various LSP servers.
return {
  "neovim/nvim-lspconfig",
  config = function ()
    local lspconfig = require("lspconfig")

    local on_attach = function(client, bufnr)
      local bufopts = { noremap=true, silent=true, buffer=bufnr }
      local keymap = vim.keymap.set

      keymap('n', 'gd', vim.lsp.buf.definition, bufopts)
      keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
      keymap('n', 'gi', vim.lsp.buf.implementation, bufopts)
      keymap('n', 'gr', vim.lsp.buf.references, bufopts)
      keymap('n', 'K', vim.lsp.buf.hover, bufopts)
      -- Add more keymaps as needed
    end

    lspconfig.clangd.setup({
      on_attach = on_attach,
      cmd = {
        "clangd",
        "--offset-encoding=utf-16",
        "--background-index",
        "--background-index-priority=low",
        "--clang-tidy",
      }
    })
    lspconfig.lua_ls.setup({on_attach = on_attach})

  end,

}
