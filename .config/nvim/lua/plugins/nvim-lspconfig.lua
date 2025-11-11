-- It provides basic, default Nvim LSP client configurations for various LSP servers.
return {
    "neovim/nvim-lspconfig",
    config = function()
        local lspconfig = require("lspconfig")
        local util = require('lspconfig.util')

        local on_attach = function(client, bufnr)
            local bufopts = {noremap = true, silent = true, buffer = bufnr}
            local keymap = vim.keymap.set

            keymap('n', 'gd', vim.lsp.buf.definition, bufopts)
            keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
            keymap('n', 'gi', vim.lsp.buf.implementation, bufopts)
            keymap('n', 'gr', vim.lsp.buf.references, bufopts)
            keymap('n', 'K', vim.lsp.buf.hover, bufopts)
            -- Add more keymaps as needed
            -- Disable diagnostics from this client to hide linting messages for R
            if client.name == "r_language_server" then
                vim.diagnostic.disable(bufnr)
            end
        end

        lspconfig.clangd.setup({
            on_attach = on_attach,
            cmd = {
                "clangd", "--offset-encoding=utf-16", "--background-index",
                "--background-index-priority=low", "--clang-tidy"
            },
            filetypes = {
                "c", "cpp", "objc", "objcpp", "cuda", "proto", "cu", "cuh"
            }
        })
        lspconfig.pyright.setup({on_attach = on_attach})
        lspconfig.cmake.setup({
            cmd = {'cmake-language-server'},
            on_attach = on_attach,
            filetypes = {'cmake'},
            root_dir = util.root_pattern('CMakePresets.json',
                                         'CTestConfig.cmake', '.git', 'build',
                                         'cmake'),
            single_file_support = true,
            init_options = {
                buildDirectory = 'build' -- adjust if your build directory differs
            }
        })
        lspconfig.texlab.setup({on_attach = on_attach})
        lspconfig.ltex.setup({on_attach = on_attach})
        lspconfig.lua_ls.setup({on_attach = on_attach})
        lspconfig.glsl_analyzer.setup({on_attach = on_attach})

        -- To install it: install.packages("languageserver") in R
        lspconfig.r_language_server.setup({
            on_attach = on_attach,
            cmd = {"R", "--slave", "-e", "languageserver::run()"},
            filetypes = {"r", "rmd"},
            root_dir = util.root_pattern(".git", "Rproj.user")
        })

        -- To install it: https://github.com/eclipse-lemminx/lemminx
        -- Then, copy the gebnerate jar into ~/.local/bin/
        -- Uh, you need java sdk...
        lspconfig.lemminx.setup({
            on_attach = on_attach,
            filetypes = {"xml", "xacro"},
            cmd = {
                "java", "-jar",
                vim.fn.expand("~/.local/bin/org.eclipse.lemminx-uber.jar")
            }
        })
    end

}
