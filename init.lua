vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.keymap.set('i', 'jj', '<Esc>')
vim.keymap.set('i', 'kk', '<Esc>l')

vim.keymap.set('n', '<leader>x', vim.cmd.Ex)

vim.keymap.set('n', '<leader>;', '$a;<Esc>')

vim.keymap.set('n', '<leader>/', '<Cmd>noh<CR>')
vim.opt.tabstop = 4
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.keymap.set({ 'n', 'v' }, 'D', '"_d')

vim.keymap.set('n', '<leader>qq', '<Cmd>q<CR>')
vim.keymap.set('n', '<leader>qw', '<Cmd>wq<CR>')

vim.opt.list = true
vim.opt.listchars = { tab = '⟶ ', trail = '•', nbsp = '␣' }

vim.opt.cursorline = false
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.signcolumn = 'yes'

vim.opt.showmode = true

vim.opt.scrolloff = 100

-- vim.opt.clipboard = 'unnamed'
vim.opt.clipboard = 'unnamedplus'

vim.opt.undofile = true

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup 'plugins'
