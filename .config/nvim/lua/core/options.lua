local opt = vim.opt

-- line numbers
opt.relativenumber = true -- show relative line numbers
opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width (consistent with the previous)
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
opt.wrap = true
opt.linebreak = true

-- to scroll better (mi gira la testa)
-- opt.scrolloff = 999

-- search settings
opt.ignorecase = true -- ignore case when searching (good for command lowercase/uppercase)
opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
opt.cursorline = true -- highlight the current cursor line

-- for better visual block
opt.virtualedit = "block" -- Allow virutal editing in Visual block mode

-- For split when global changes
opt.inccommand = "split"

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard = "unnamedplus" -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to the right
opt.splitbelow = true -- split horizontal window to the bottom

opt.iskeyword:append("-") -- consider string-string as whole word

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
