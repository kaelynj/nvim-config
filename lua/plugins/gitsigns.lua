-- ========================================================================== --
-- ==                        GIT SIGNS PLUGIN                              == --
-- ========================================================================== --
--   This plugin will add "signs" or indicators of modified lines within
--     a git repository.  This lets you know which lines have been changed
--     from the last commit.
require('gitsigns').setup({
  signs = {
    add = {text = '▎'},
    change = {text = '▎'},
    delete = {text = '➤'},
    topdelete = {text = '➤'},
    changedelete = {text = '▎'},
  }
})
