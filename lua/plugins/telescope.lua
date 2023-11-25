-- ========================================================================== --
-- ==                    TELESCOPE FUZZY FINDER                            == --
-- ========================================================================== --
--   This plugin is a _highly_ extendable fuzzy finder for filtering through
--     lists of items.  It can be used to search currently opened files, git
--     commits, command history, keybindings, colorschemes, and much more!
--     There are in total 51 different commands for this plugin!

-- These are just the default options for telescope
require('telescope').setup {
	defaults = {
	  -- Default configuration for telescope goes here:
	  -- config_key = value,
	  -- ..
	},
	pickers = {
	  -- Default configuration for builtin pickers goes here:
	  -- picker_name = {
	  --   picker_config_key = value,
	  --   ...
	  -- }
	  -- Now the picker_config_key will be applied every time you call this
	  -- builtin picker
	},
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    }
  }
}
-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
require('telescope').load_extension('fzf')

-- To finish loading this plugin we'll set a few keybindings that 
--   will prove useful
vim.keymap.set('n', '<leader><space>', '<cmd>Telescope buffers<cr>')
vim.keymap.set('n', '<leader>?', '<cmd>Telescope oldfiles<cr>')
vim.keymap.set('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>fd', '<cmd>Telescope diagnostics<cr>')
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope current_buffer_fuzzy_find<cr>')
