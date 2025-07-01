-- A simple neovim plugin that renders diagnostics using virtual lines on top of the real line of code.
return {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    config = function()
        require("lsp_lines").setup()
        vim.keymap.set("n", "<Leader>l", require("lsp_lines").toggle,
                       {desc = "Toggle lsp_lines"})
        vim.keymap.set('n', '<Leader>le', function()
            vim.diagnostic.open_float(nil, {focus = true})
        end)
    end
}
