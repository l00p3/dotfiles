return {
    -- Main nvim-treesitter plugin
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "main",
        build = ":TSUpdate",
        lazy = false, -- load immediately, required for dependent plugins
        config = function()
            -- Treesitter setup
            local ok, configs = pcall(require, "nvim-treesitter.config")
            if not ok then
                vim.notify("[Treesitter] nvim-treesitter not found!",
                           vim.log.levels.ERROR)
                return
            end

            configs.setup({
                ensure_installed = {
                    "c", "cpp", "lua", "vim", "vimdoc", "query", "markdown",
                    "markdown_inline", "cmake", "dockerfile", "json", "latex",
                    "python", "typst", "yaml", "glsl"
                },
                highlight = {enable = true},
                auto_install = true,
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<Leader>ss",
                        node_incremental = "<Leader>si",
                        scope_incremental = "<Leader>sc",
                        node_decremental = "<Leader>sd"
                    }
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["ac"] = "@class.outer",
                            ["ic"] = {
                                query = "@class.inner",
                                desc = "Select inner part of a class region"
                            },
                            ["as"] = {
                                query = "@local.scope",
                                query_group = "locals",
                                desc = "Select language scope"
                            }
                        },
                        selection_modes = {
                            ['@parameter.outer'] = 'v',
                            ['@function.outer'] = 'v',
                            ['@class.outer'] = '<c-v>'
                        },
                        include_surrounding_whitespace = true
                    }
                }
            })
        end
    } -- nvim-treesitter-textobjects must load after nvim-treesitter
    -- {
    --     "nvim-treesitter/nvim-treesitter-textobjects",
    --     after = "nvim-treesitter",
    --     dependencies = {"nvim-treesitter/nvim-treesitter"} -- ensures correct load order
    -- }
}
