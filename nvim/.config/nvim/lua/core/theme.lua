local M = {}
local theme_file = vim.fn.stdpath("data") .. "/theme.txt"

local available_themes = {
  "catppuccin-latte",
  "catppuccin-frappe",
  "catppuccin-macchiato",
  "catppuccin-mocha",
  "everforest",
  "gruvbox",
  "nord",
  "miasma",
  "neosolarazide",
}

function M.set(theme)
  if not theme or theme == "" then
    return
  end

  vim.g.colors_name = theme
  local ok, _ = pcall(vim.cmd.colorscheme, theme)
  if not ok then
    vim.notify("Erro: Não foi possível carregar o tema " .. theme, vim.log.levels.ERROR)
    return
  end

  local file = io.open(theme_file, "w")
  if file then
    file:write(theme)
    file:close()
  end

  vim.notify("Tema alterado para: " .. theme, vim.log.levels.INFO)
end

function M.load()
  local last_theme = "catppuccin-frappe"
  local file = io.open(theme_file, "r")
  if file then
    local content = file:read("*a")
    if content and content ~= "" then
      last_theme = content:gsub("%s+", "") -- remove whitespace
    end
    file:close()
  end

  vim.g.colors_name = last_theme
  local ok, _ = pcall(vim.cmd.colorscheme, last_theme)
  if not ok then
    vim.notify("Tema salvo '" .. last_theme .. "' não encontrado. Carregando padrão.", vim.log.levels.WARN)
    vim.cmd.colorscheme("catppuccin-frappe")
  end
end

function M.list_themes()
  return available_themes
end

function M.toggle_theme()
  local current_theme = vim.g.colors_name or "catppuccin-frappe"

  local current_index = 1
  for i, theme in ipairs(available_themes) do
    if theme == current_theme then
      current_index = i
      break
    end
  end

  local next_index = (current_index % #available_themes) + 1
  M.set(available_themes[next_index])
end

vim.api.nvim_create_user_command("ThemeSet", function(opts)
  M.set(opts.args)
end, {
  nargs = 1,
  complete = function()
    return available_themes
  end,
  desc = "Define o tema atual",
})

vim.api.nvim_create_user_command("ThemeToggle", function()
  M.toggle_theme()
end, { desc = "Alterna entre os temas disponíveis" })

vim.api.nvim_create_user_command("ThemeList", function()
  local current = vim.g.colors_name
  print("Temas disponíveis:")
  for _, theme in ipairs(available_themes) do
    local marker = theme == current and " (atual)" or ""
    print("  " .. theme .. marker)
  end
end, { desc = "Lista todos os temas disponíveis" })

vim.keymap.set("n", "<leader>tt", M.toggle_theme, { desc = "Toggle theme" })
vim.keymap.set("n", "<leader>ts", function()
  vim.ui.select(available_themes, {
    prompt = "Selecione um tema:",
  }, function(choice)
    if choice then
      M.set(choice)
    end
  end)
end, { desc = "Select theme" })

return M
