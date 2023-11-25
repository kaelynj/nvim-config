-- ========================================================================== --
-- ==                         NVIM TREESITTER                              == --
-- ========================================================================== --
--   Treesitter is a syntax highlighting tool built into Neovim.  This plugin
--     'nvim-treesitter' wraps the Neovim treesitter API to provide
--     functionalities such as highlighting and incremental selection, and a
--     command to easily install parsers.
require('nvim-treesitter.configs').setup({
	highlight = {
		enabled = true,
	},
	textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      }
    },
  },
	parser_install_dir = "$VIM/lua/treesitter-parsers",
	ensure_installed = { 
		-- Ensure specific parsers are installed every time vim opens
	 },
})

-- Add a lightweight treesitter module to show context of the currently visible buffer contents.
--  This is primarily useful for looking at functions and their contents.
require'treesitter-context'.setup{
  enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  line_numbers = true,
  multiline_threshold = 20, -- Maximum number of lines to show for a single context
  trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
  -- Separator between context and content. Should be a single character string, like '-'.
  -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  separator = nil,
  zindex = 20, -- The Z-index of the context window
  on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}
