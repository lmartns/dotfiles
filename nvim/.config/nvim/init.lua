require("core")
require("lazy-setup")

vim.diagnostic.config({
  virtual_text = true, -- Desativa texto virtual no final da linha
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  deduplicate = true,
})

vim.o.termguicolors = true

-- Adicione temporariamente este código ao seu init.lua para ver quais são as fontes dos diagnósticos
vim.api.nvim_create_user_command("DiagnosticDetails", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local diagnostics = vim.diagnostic.get(bufnr)
  for i, d in ipairs(diagnostics) do
    print(i, d.source, d.code or "no_code", d.message)
  end
end, {})

vim.cmd([[
  highlight Normal gui=bold cterm=bold
  highlight Comment gui=italic cterm=italic
  highlight Function gui=bold cterm=bold
]])
