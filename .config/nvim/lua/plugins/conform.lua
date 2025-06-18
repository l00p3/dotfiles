-- Formatter manager
return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            cpp = {"clang_format"},
            c = {"clang_format"},
            python = {"black"},
            lua = {"lua-format"},
            tex = {"latexindent"},
            plaintex = {"latexindent"},
            cmake = {"cmake_format"}
        },
        format_on_save = {timeout_ms = 500, lsp_format = "fallback"}
    }

}
