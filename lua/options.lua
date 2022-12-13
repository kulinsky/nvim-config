vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.smartindent = true
vim.opt.expandtab = true

vim.opt.wrap = false


vim.g.mapleader = " "

vim.opt.cursorline = false 
vim.opt.cursorcolumn = false

vim.opt.mouse = "a"
vim.opt.clipboard = "unnamedplus"

vim.opt.smartcase = true
vim.opt.textwidth = 120
vim.opt.linebreak = true
vim.opt.scrolloff = 10 

vim.g.netrw_banner = 0

vim.opt.smartindent = true
vim.opt.completeopt = "menuone,noselect"
vim.opt.signcolumn = "yes" 
vim.opt.termguicolors = true

-- disable default show mode
vim.opt.showmode = false

-- highlight on yank
vim.cmd([[au TextYankPost * silent! lua vim.highlight.on_yank()]])

