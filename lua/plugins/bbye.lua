-- ========================================================================== --
-- ==                         BBYE (BUFFER BYE) PLUGIN                     == --
-- ========================================================================== --
--   This plugin allows you to delete buffers (i.e. close files) without
--     closing your windows or messing up layouts.  Instead of a typical setup
--     function we'll just add a few keymappings

vim.keymap.set('n', '<leader>bd', '<cmd>Bdelete<CR>')
vim.keymap.set('n', '<leader>bw', '<cmd>Bwipeout<CR>')
