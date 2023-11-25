-- ========================================================================== --
-- ==                         COMMENT PLUGIN                               == --
-- ========================================================================== --
--   Smart and powerful comment plugin 🧠 💪 for neovim.  Adds functionality
--     to automagically add comments to lines, words, or visual selections
require('Comment').setup({
	opts = {
		-- Add space b/w comment and line
		padding = true,
		---LHS of toggle mappings in NORMAL mode
    toggler = {
        ---Line-comment toggle keymap
        line = 'gcc',
        ---Block-comment toggle keymap
        block = 'gbc',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = 'gc',
        ---Block-comment keymap
        block = 'gb',
    },
    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
    },
	},
})

