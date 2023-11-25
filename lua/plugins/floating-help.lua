-- ========================================================================== --
-- ==                 FLOATING HELP WINDOW PLUGIN                          == --
-- ========================================================================== --
--  This plugin will load `:help` and `cppman` commands in an anchorable 
--  and resizable floating window.
--

require('floating-help').setup({
	  -- These are the defaults
  width = 90,   -- Whole numbers are columns/rows
  height = 0.95, -- Decimals are a percentage of the editor
  position = 'NE',   -- NW,N,NW,W,C,E,SW,S,SE (C==center)
  borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
})

-- Create a keymap for toggling the help window
vim.keymap.set('n', '<F1>', '<cmd>FloatingHelpToggle<cr>')
-- -- Create a keymap to search cppman for the word under the cursor
-- vim.keymap.set('n', '<F2>', function()
--   fh.open('t=cppman', vim.fn.expand('<cword>'))
-- end)

-- Function to create command abbreviations.  We'll use this to create
--  aliases to call FloatingHelp instead of 'help'.
local function cmd_abbrev(abbrev, expansion)
  local cmd = 'cabbr ' .. abbrev .. ' <c-r>=(getcmdpos() == 1 && getcmdtype() == ":" ? "' .. expansion .. '" : "' .. abbrev .. '")<CR>'
  vim.cmd(cmd)
end

-- Redirect `:h` to `:FloatingHelp`
cmd_abbrev('h',         'FloatingHelp')
cmd_abbrev('help',      'FloatingHelp')
cmd_abbrev('helpc',     'FloatingHelpClose')
cmd_abbrev('helpclose', 'FloatingHelpClose')
