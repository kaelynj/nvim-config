-- ========================================================================== --
-- ==                   TERMINAL UI PLUGIN                                 == --
-- ========================================================================== --
--   This plugin manages windows with terminal buffers, allowing them to be
--     toggled with a single keybinding.
--
require('toggleterm').setup({
	open_mapping = '<C-n>',
	direction = 'float',
	shade_terminals = true,
	float_opts = {
		border = 'curved',
	},
})
