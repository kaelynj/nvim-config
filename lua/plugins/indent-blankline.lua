-- ========================================================================== --
-- ==                   INDENT BLANKLINE PLUGIN                            == --
-- ========================================================================== --
--  Plugin to add in tab guides
require('ibl').setup({
	enabled = true,
--	buftype_exclude = { "terminal" },    -- Exclude this plugin in terminal buffers
--	filetype_exclude = { "dashboard"},   -- Exclude this plugin in dashboard
	scope = {
		enabled = true,
	},
  indent = {
    char = '▏',
  },
})
require('ibl').overwrite({
	exclude = {
		filetypes = {
			"dashboard",
			"help",
		}
	}
})
