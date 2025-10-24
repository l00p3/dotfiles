-- Formatter manager
return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            cpp = {"clang_format"},
            c = {"clang_format"},
            cu = {"clang_format"},
            cuda = {"clang_format"},
            vert = {"clang_format"},
            glsl = {"clang_format"},
            frag = {"clang_format"},
            python = {"black"},
            lua = {"lua-format"},
            tex = {"latexindent"},
            plaintex = {"latexindent"},
            cmake = {"cmake_format"},

            -- To install it, in R: 
            -- install.packages("styler")
            -- install.packages("remotes")
            -- remotes::install_github("devOpifex/r.nvim")
            -- And this on terminal
            -- echo "style=tidy" > ~/.rnvim
            r = {"styler"}

        },
        format_on_save = {timeout_ms = 2000, lsp_format = "fallback"}
    }

}
