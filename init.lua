-- ========================================================================== --
-- ==                           EDITOR SETTINGS                            == --
-- ========================================================================== --
-- Show line numbers
vim.opt.number = true
-- Set mouse support for all modes
vim.opt.mouse = "a"
-- Ignore case in search unless patter specifically contains uppercase
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Disable highlight of previous search
vim.opt.hlsearch = false
-- Wrap lines and preserve indentation of 'virtual' line after wrap
vim.opt.wrap = true
vim.opt.breakindent = true
-- Set amount of space a TAB character has on screen
vim.opt.tabstop = 2
-- Set amount of characters nvim will use to indent a line
vim.opt.shiftwidth = 2
vim.opt.expandtab = false -- Don't transform tab to spaces

-- Set netrw file browser settings
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 20

-- Disable netrw to make nvim-tree file explorer work
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- ========================================================================== --
-- ==                             KEYBINDINGS                              == --
-- ========================================================================== --
-- Set the leader key to space
vim.g.mapleader = " "
vim.g.maplocalleader = " "
-- -- Set a global copy/past sequence with 'gy' and 'gp'
-- vim.keymap.set({'n', 'x'}, 'gy', '"+y')
-- vim.keymap.set({'n', 'x'}, 'gp', '"+p')
-- -- Modify d and dd to delete text without changing internal registers
-- vim.keymap.set({'n', 'x'}, 'd', '"_d')
-- vim.keymap.set({'n', 'x'}, 'dd', '"_dd')
require("config.keymaps")

-- ========================================================================== --
-- ==                               COMMANDS                               == --
-- ========================================================================== --
--
-- Most of these have been taken from the official LazyVim repo
-- Close some filetypes with <q>

local function augroup(name)
	return vim.api.nvim_create_augroup("kaesvim_" .. name, { clear = true })
end

vim.api.nvim_create_autocmd("FileType", {
	group = augroup("close_with_q"),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"query",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- wrap and check for spelling in text filetypes
vim.api.nvim_create_autocmd("FileType", {
	group = augroup("wrap_spell"),
	pattern = { "gitcommit", "markdown" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.spell = true
	end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = augroup("auto_create_dir"),
	callback = function(event)
		if event.match:match("^%w%w+://") then
			return
		end
		local file = vim.loop.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

-- ========================================================================== --
-- ==                     INSTALL LAZY PLUGIN MANAGER                      == --
-- ========================================================================== --

-- Install Lazy Plugin Manager
local lazy = {}
function lazy.install(path)
	if not vim.loop.fs_stat(path) then
		print("Installing lazy.nvim....")
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			path,
		})
	end
end

function lazy.setup(plugins)
	if vim.g.plugins_ready then
		return
	end
	-- You can "comment out" the line below after lazy.nvim is installed
	lazy.install(lazy.path)

	vim.opt.rtp:prepend(lazy.path)

	require("lazy").setup(plugins, lazy.opts)
	vim.g.plugins_ready = true
end

-- ========================================================================== --
-- ==                               PLUGINS                                == --
-- ========================================================================== --
-- Set lazy.path to specify where plugins live
lazy.path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
lazy.opts = {} -- Set this to configure options for the lazy plugin manager itself

---------------------------------------
-- Specify all the plugins to use
---------------------------------------
lazy.setup({
	-- List of plugins
	{ "folke/tokyonight.nvim" }, -- Tokyonight theme
	{
		"nvim-lualine/lualine.nvim", -- lualine bottom banner
		commit = "2248ef2",
	},
	{
		"kyazdani42/nvim-web-devicons", -- Add icon highlighting
		commit = "cdbcca2",
	},
	{
		"akinsho/bufferline.nvim", -- Add file tabs at top
		tag = "v4.4.0",
	},
	{
		"lukas-reineke/indent-blankline.nvim", -- Add indent guide highlights
		tag = "v3.3.7",
	},
	{
		"nvim-treesitter/nvim-treesitter", -- Syntax highlighting
		tag = "v0.9.1",
	},
	{
		"nvim-treesitter/nvim-treesitter-context", -- Display function contexts
		commit = "bf4d15e",
	},
	{
		"numToStr/Comment.nvim", -- Add 'gc'/'gbc' comment command
		commit = "0236521",
	},
	{
		"tpope/vim-surround", -- Manipulate surrounding patterns
		commit = "3d188ed",
	},
	{
		"kyazdani42/nvim-tree.lua", -- Tree file explorer
		commit = "5e4475d",
	},
	{
		"akinsho/toggleterm.nvim", -- Terminal UI window
		commit = "fb0c365",
	},
	{
		"tpope/vim-fugitive", -- Fancy UI for git
		commit = "46eaf89",
	},
	{
		"lewis6991/gitsigns.nvim", -- Show 'signs' of modified lines
		commit = "0ccd5fb",
	},
	{ "moll/vim-bbye" }, -- Cleaner buffer closing
	{
		"folke/which-key.nvim", -- Keybinding popup menu
		-- tag = "v1.6.0",
		commit = "4433e5e",
	},
	-------------------------------------------------------------------------------
	--  BEGIN TELESCOPE PLUGIN & DEPENDENCIES
	------------------------------------------------------------------------------
	-- Telescope is a super useful fuzzy finder, but requires some configuration
	--   and dependencies to be installed.
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.4", -- Advised to specify tag
	},
	-- Use fzf alg for telescope (needs to be compiled)
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	-- Collection of lua modules needed for telescope
	{ "nvim-lua/plenary.nvim", tag = "v0.1.4" },

	-------------------------------------------------------------------------------
	--  END TELESCOPE PLUGIN & DEPENDENCIES
	------------------------------------------------------------------------------
	{ "Tyler-Barham/floating-help.nvim" }, -- Floating help window
	{
		"nvimdev/dashboard-nvim", -- Doom-emacs-like dashboard
		commit = "63df284",
	},
	{
		"m4xshen/autoclose.nvim", -- Autoclose brakets
		commit = "37e1158",
	},
})

---------------------------------------
-- Set plugin options and configuration
---------------------------------------
require("plugins.lualine")
require("plugins.nvim-web-devicons")
require("plugins.bufferline")
require("plugins.indent-blankline")
require("plugins.treesitter")
require("plugins.comment")
require("plugins.nvim-tree")
require("plugins.toggleterm")
require("plugins.gitsigns")
require("plugins.bbye")
require("plugins.which-key")
require("plugins.telescope")
require("plugins.floating-help")
require("plugins.dashboard")
require("plugins.autoclose")

-- Specify colorscheme
vim.opt.termguicolors = true
vim.cmd.colorscheme("tokyonight")
