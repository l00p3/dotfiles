-- Performant, batteries-included completion plugin for Neovim 
return {
    "saghen/blink.cmp",
    dependencies = {"L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets"},
    version = "1.*",
    opts = {
        keymap = {preset = "super-tab"},
        appearance = {nerd_font_variant = "normal"},
        completion = {
            documentation = {auto_show = true},
            trigger = {show_in_snippet = false} -- to avoid show completion in snippets
        },
        sources = {
            default = {"lazydev", "lsp", "path", "snippets", "buffer"},
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    -- make lazydev completions top priority (see `:h blink.cmp`)
                    score_offset = 100
                }
            }
        },
        fuzzy = {implementation = "prefer_rust_with_warning"},
        snippets = {
            preset = "luasnip", -- Use LuaSnip as the snippet engine
            score_offset = 1000 -- Make snippets even higher priority
        }
    },
    opts_extend = {"sources.default"},
    config = function(_, opts) -- Load my snippets
        require("luasnip").setup({enable_autosnippets = true})
        require("luasnip.loaders.from_lua").lazy_load({
            paths = {vim.fn.stdpath("config") .. "/lua/snippets"}
        })

        -- Make cpp snippets to be used in CUDA, too
        local luasnip = require("luasnip")
        luasnip.filetype_extend("cuda", {"cpp"})
        luasnip.filetype_extend("cu", {"cpp"})

        require("blink.cmp").setup(opts)
    end
}

