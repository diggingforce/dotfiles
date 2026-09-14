-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.clipboard = "unnamedplus"
vim.opt.scrolloff = 8 -- Keep 8 lines above/below cursor
vim.opt.sidescrolloff = 8
vim.opt.smoothscroll = true -- Smooth scrolling on wrapped lines (Neovim 0.10+)
vim.opt.cursorline = true -- Highlight current line
vim.opt.wrap = false -- Don't wrap lines by default
vim.opt.undofile = true -- Persistent undo history
vim.opt.confirm = true -- Confirm to save changes before exiting modified buffer
