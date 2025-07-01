return {
    {
        "nvim-tree/nvim-tree.lua",
        dependencies = {"nvim-tree/nvim-web-devicons"}, -- optional, for file icons

        config = function()

            -- Setup keymap
            vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>") -- toggle file explorer

            -- change color for arrows in tree to light blue
            vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

            require("nvim-tree").setup {
                -- change folder arrow icons
                renderer = {
                    icons = {
                        glyphs = {
                            folder = {
                                arrow_closed = "󰞘", -- arrow when folder is closed
                                arrow_open = "󰞖" -- arrow when folder is open
                            }
                        }
                    }
                },
                -- disable window_picker for
                -- explorer to work well with
                -- window splits
                actions = {
                    open_file = {
                        window_picker = {enable = false},
                        quit_on_open = true
                    }
                },

                -- Show files in .gitignore
                filters = {
                    git_ignored = false -- <--- This line enables .gitignore files to be shown
                }
            }

        end
    }
}
