-- ========================================================================== --
-- ==                          BUFFERLINE PLUGIN                           == --
-- ========================================================================== --
--    A _snazzy_ bufferline (with tabpage integration) for Neovim
--  This plugin modifies the gui behavior of buffers.  They appear as tabs
--    on the top of the page instead of known internally.
require('bufferline').setup({
	options = {
    mode = 'buffers', -- Tell bufferline we want one tab per file
		-- mode = 'tabs',       -- Only work with tabpages rather than buffers
    offsets = {
      {filetype = {        -- Tell bufferline to not create a tab in tree
					'NvimTree',      --  explorer
					'checkhealth',
				}
			} 
			                        
    },
  },
	-- Modify the colors of the components in each rendered tab
  highlights = {
    buffer_selected = {
      italic = false
    },
    indicator_selected = {
			-- Specify using the same highlight colors as our colorscheme
      fg = {attribute = 'fg', highlight = 'Function'},
      italic = false
    }
  }
})
