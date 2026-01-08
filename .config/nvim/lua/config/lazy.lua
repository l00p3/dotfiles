-- Bootstrap lazy.nvim
-- vim.fn allows to access vimscript functions in lua
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- fs_stat simply check if that directory exists
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	-- system() takes a cmd and run it, with a return (that after is checked)
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
-- rtp is the runtime path (the list of directory where vim watches when he has to answer a question
-- (like trying to have syntax highlighting for cpp files) and it cannot answer by himself), also the
-- plugins are checked there, so it will ask to lazy if he has the plugin and it will be loaded
-- The ":" serves to pass the caler of the function itself, 
-- so it is like writing vim.opt.rtp.prepend(vim.opt.rtp, lazypath)
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
-- Here, calling require is when it searches for this "lazy" inside the rtp and,
-- it will find it inside the lazypath (under a lua folder)
-- Load all the plugins folder
require("lazy").setup("plugins")
