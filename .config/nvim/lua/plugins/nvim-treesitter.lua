-- To facilitate the installation of tree-parsers for treesitter inside nvim
return {
  -- Syntax aware text-objects, select, move, swap, and peek support.
  {"nvim-treesitter/nvim-treesitter-textobjects"},

  -- The actual nvim-treesitter
  {"nvim-treesitter/nvim-treesitter", 
  branch = 'master', 
  lazy = false, 
  build = ":TSUpdate",

  config = function() 
      require("nvim-treesitter.configs").setup({
      -- A list of parser names, or "all" (the listed parsers MUST always be installed)
      ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline", "c", "cmake", "cpp", "dockerfile", "json", "latex", "python", "typst", "yaml" },
      auto_install = true,

      -- Modules
      highlight = {
        enable = true,
      },

      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<Leader>ss",
          node_incremental = "<Leader>si",
          scope_incremental = "<Leader>sc",
          node_decremental = "<Leader>sd",
        },
      },

      -- nvim-treesitter-textobjects config
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
            ["as"] = { query = "@local.scope", query_group = "locals", desc = "Select language scope" },
          },
          selection_modes = {
            ['@parameter.outer'] = 'v', -- charwise
            ['@function.outer'] = 'v', -- linewise
            ['@class.outer'] = '<c-v>', -- blockwise
          },
          -- If you set this to `true` (default is `false`) then any textobject is
          -- extended to include preceding or succeeding whitespace. Succeeding
          -- whitespace has priority in order to act similarly to eg the built-in
          -- `ap`.
          include_surrounding_whitespace = true,
        },
      },

    })
  end,}

}
