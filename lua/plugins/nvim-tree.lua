-- ========================================================================== --
-- ==                   NVIM TREE FILE EXPLORER                            == --
-- ========================================================================== --
--  This plugin creates a file explorer tree similar to other IDEs.  It
--    includes file type icons, git integration, diagnostics, among other
--    thing.
require('nvim-tree').setup({
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
	hijack_cursor = false,
  -- on_attach = function(bufnr)
  --   local bufmap = function(lhs, rhs, desc)
  --     vim.keymap.set('n', lhs, rhs, {buffer = bufnr, desc = desc})
  --   end
  --
  --   -- See :help nvim-tree.api
  --   local api = require('nvim-tree.api')
  --  
  --   bufmap('gh', api.tree.toggle_hidden_filter, 'Toggle hidden files')
  -- end
})

vim.keymap.set('n', '<leader>e', '<cmd>NvimTreeToggle<cr>')
