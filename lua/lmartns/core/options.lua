vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.relativenumber = true
opt.number = true

opt.tabstop = 2 -- space for tabs
opt.shiftwidth = 2 --spaces for indent
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy ident from durrent line when starting new one
