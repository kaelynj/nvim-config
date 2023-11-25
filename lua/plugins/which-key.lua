-- ========================================================================== --
-- ==                      WHICH-KEY POPUP MENU                            == --
-- ========================================================================== --
--   This plugin will display a popup menu with possible key bindings of the 
--     command that you started typing.  Quite convenient when learning your
--     own neovim configuration.
require('which-key').setup({
	event = "VeryLazy",
	init = function()
		vim.o.timeout = true
		vim.o.timeoutlen = 300
	end,
	opts = {
		-- Your options go here
		window = {
			border = "shadow"
		},
		hidden = {},
	}
})
