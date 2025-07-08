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

vim.cmd([[
  highlight Normal gui=bold cterm=bold
  highlight Comment gui=italic cterm=italic
  highlight Function gui=bold cterm=bold
]])
