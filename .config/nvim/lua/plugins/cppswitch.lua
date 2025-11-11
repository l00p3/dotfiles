return {
    "jakobknauer/cppswitch",
    config = function()
        -- File extensions that indicate header files
        vim.g.cppswitch_header_extensions = {
            "h", "hpp", "hh", "h++", "hxx", "H"
        }
        -- File extensions that indicate implementation files
        vim.g.cppswitch_impl_extensions = {"c", "cpp", "cc", "c++", "cxx", "C"}

        -- The file extension to use for creating a header file, when none exists
        vim.g.cppswitch_preferred_header_extension = "h"
        -- The file extension to use for creating an implementation file, when none exists
        vim.g.cppswitch_preferred_impl_extension = "cpp"

        -- In which directories to search for the corresponding header/implementation file, and in which order.
        -- List, allowed items: "same" and "twin"
        vim.g.cppswitch_search_dirs = {"same", "twin"}

        -- In which directory to create a header/implementation file, if it doesn't exist.
        -- Possible values: "same" or "twin"
        vim.g.cppswitch_creation_dir = "same"

        -- For determining the 'twin directories'
        vim.g.cppswitch_header_dir = "include"
        vim.g.cppswitch_impl_dir = "src"

        -- Keymaps
        vim.keymap.set("n", "<leader>S", "<cmd>CppswitchSwitch<CR>")
        vim.keymap.set("n", "<lader>h", "<cmd>CppswitchGotoHeader<CR>")
        vim.keymap.set("n", "<leader>c", "<cmd>CppswitchGotoImpl<CR>")

        require("cppswitch").setup()
    end
}
