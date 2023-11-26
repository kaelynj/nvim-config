-- ========================================================================== --
-- ==                NEORG: ORGANIZE YOUR LIFE PLUGIN                      == --
-- ========================================================================== --
--    Neorg (_Neo_: new, _org_:organization)	is a plugin designed to
--      reimagine orgaization as you know it.  Modernity meats instane
--      flexibility.  The furture of organizing your life in Neovim
--
require('neorg').setup({
	dependencies = {"nvim-lua/plenary.nvim"},
	build = ":Neorg sync-parsers",
	-- cmd = "Neorg",
	-- ft = "norg",
	load = {
			["core.defaults"] = {}, -- Loads default behaviour
			["core.concealer"] = {
			}, -- Adds pretty icons to your documents
			["core.dirman"] = { -- Manages Neorg workspaces
				config = {
					workspaces = {
					-- eclipse_phase = "~/notes/eclipse-phase",
					-- oldGods = "~/notes/old-gods-of-appalachia",
					-- homelab = "~/notes/homelab",
					testing = "~/notes/neorg-testing",
					},
				},
			},
	 },
})
vim.opt.conceallevel=2
