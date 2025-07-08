local M = {}

local theme_file = vim.fn.stdpath("data") .. "/theme.txt"

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
end

function M.load()
  local last_theme = "catppuccin-frappe"

  local file = io.open(theme_file, "r")
  if file then
    local content = file:read("*a")
    if content and content ~= "" then
      last_theme = content
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

return M