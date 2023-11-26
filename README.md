# Kae's Personal Nvim Config

This is my first attempt at creating my own neovim configuration.  It is largely based on [https://github.com/LazyVim/LazyVim](LazyVim) with a few additional keymaps and plugins (namely [https://github.com/nvim-neorg/neorg](neorg)). For plugin management I'm using [https://github.com/folke/lazy.nvim](lazy).

## Current Issues
- Neorg does not play nicely with treesitter, though it appears this is an issue with nvim itself.  Whenever I change workspaces, I get treesitter errors claiming the 'norg' parser is not installed when, in fact, it is.
  - This error consistently occurs for Neovim 0.9.4, but the nightly build *mostly* works.  I've pinned most of the plugins to commits or tags to keep the plugins frozen for now until I figure this out.
