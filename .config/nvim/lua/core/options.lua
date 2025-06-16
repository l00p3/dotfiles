-- line numbers
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
vim.opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
vim.opt.shiftwidth = 2 -- 2 spaces for indent width (consistent with the previous)
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
vim.opt.wrap = true
vim.opt.linebreak = true

-- to scroll better (mi gira la testa)
-- vim.opt.scrolloff = 999

-- search settings
vim.opt.ignorecase = true -- ignore case when searching (good for command lowercase/uppercase)
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
vim.opt.cursorline = true -- highlight the current cursor line

-- for better visual block
vim.opt.virtualedit = "block" -- Allow virutal editing in Visual block mode

-- For split when global changes
vim.opt.inccommand = "split"

-- appearance
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

-- backspace
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
vim.opt.clipboard = "unnamedplus" -- use system clipboard as default register

-- split windows
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

vim.opt.iskeyword:append("-") -- consider string-string as whole word

-- infinite undo
vim.o.undofile = true
vim.o.undodir = vim.fn.expand("$HOME/.undo")

-- indent remains in visual mode
vim.keymap.set("v", ">", ">gv", { noremap = true })
vim.keymap.set("v", "<", "<gv", { noremap = true })

-- paste does not yank
vim.api.nvim_set_keymap("v", "p", "pgvy", { noremap = true })

-- avoid VimTex to open the quickfix window on warnings
vim.g.vimtex_quickfix_open_on_warning = 0

-- Set up diagnostics (compatible with lsp_lines plugin)
vim.diagnostic.config({
  virtual_text = false,
  virtual_lines = true,
})
