return {
    "lervag/vimtex",
    lazy = false, -- we don't want to lazy load VimTeX
    init = function()
        vim.g.vimtex_view_method = "skim"

        -- Set the compiler method to generic (which lets us use make)
        vim.g.vimtex_compiler_method = "generic"

        -- Configure the generic compiler to run 'make'
        vim.g.vimtex_compiler_generic = {
            command = "make",
            -- 'hooks' can be used if you need post-processing, but usually empty is fine
            hooks = {}
        }
    end
}
