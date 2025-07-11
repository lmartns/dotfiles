require("core")
require("lazy-setup")
require("core.theme").load()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  deduplicate = true,
})

vim.o.termguicolors = true
vim.opt.clipboard = "unnamedplus"

vim.cmd([[
  highlight Normal gui=bold cterm=bold
  highlight Comment gui=italic cterm=italic
  highlight Function gui=bold cterm=bold
]])

vim.g.neovide_input_use_logo = true

vim.keymap.set("i", "<D-v>", "<C-R>+", { noremap = true, silent = true, desc = "Colar do sistema" })

vim.keymap.set("n", "<D-v>", '"+p', { noremap = true, silent = true, desc = "Colar do sistema" })

vim.keymap.set("c", "<D-v>", "<C-R>+", { noremap = true, silent = true, desc = "Colar do sistema" })
