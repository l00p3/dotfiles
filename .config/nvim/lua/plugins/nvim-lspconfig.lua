return {
    "neovim/nvim-lspconfig",
    config = function()
        local lsp_util = require("lspconfig.util")

        local on_attach = function(client, bufnr)
            local bufopts = {noremap = true, silent = true, buffer = bufnr}
            local keymap = vim.keymap.set

            keymap('n', 'gd', vim.lsp.buf.definition, bufopts)
            keymap('n', 'gD', vim.lsp.buf.declaration, bufopts)
            keymap('n', 'gi', vim.lsp.buf.implementation, bufopts)
            keymap('n', 'gr', vim.lsp.buf.references, bufopts)
            keymap('n', 'K', vim.lsp.buf.hover, bufopts)

            if client.name == "r_language_server" then
                vim.diagnostic.disable(bufnr)
            end
        end

        -- clangd
        vim.lsp.config.clangd = {
            on_attach = on_attach,
            cmd = {
                "clangd", "--offset-encoding=utf-16", "--background-index",
                "--background-index-priority=low", "--clang-tidy"
            },
            filetypes = {
                "c", "cpp", "objc", "objcpp", "cuda", "proto", "cu", "cuh"
            }
        }
        vim.lsp.enable("clangd")

        -- pyright
        vim.lsp.config.pyright = {on_attach = on_attach}
        vim.lsp.enable("pyright")

        -- cmake
        vim.lsp.config.cmake = {
            cmd = {'cmake-language-server'},
            on_attach = on_attach,
            filetypes = {'cmake'},
            root_dir = lsp_util.root_pattern('CMakePresets.json',
                                             'CTestConfig.cmake', '.git',
                                             'build', 'cmake'),
            single_file_support = true,
            init_options = {buildDirectory = 'build'}
        }
        vim.lsp.enable("cmake")

        -- texlab
        vim.lsp.config.texlab = {on_attach = on_attach}
        vim.lsp.enable("texlab")

        -- ltex
        vim.lsp.config.ltex = {on_attach = on_attach}
        vim.lsp.enable("ltex")

        -- lua_ls
        vim.lsp.config.lua_ls = {on_attach = on_attach}
        vim.lsp.enable("lua_ls")

        -- glsl_analyzer
        vim.lsp.config.glsl_analyzer = {on_attach = on_attach}
        vim.lsp.enable("glsl_analyzer")

        -- R language server
        vim.lsp.config.r_language_server = {
            on_attach = on_attach,
            cmd = {"R", "--slave", "-e", "languageserver::run()"},
            filetypes = {"r", "rmd"},
            root_dir = lsp_util.root_pattern(".git", "Rproj.user")
        }
        vim.lsp.enable("r_language_server")

        -- lemminx (XML)
        vim.lsp.config.lemminx = {
            on_attach = on_attach,
            filetypes = {"xml", "xacro"},
            cmd = {
                "java", "-jar",
                vim.fn.expand("~/.local/bin/org.eclipse.lemminx-uber.jar")
            }
        }
        vim.lsp.enable("lemminx")
    end
}
