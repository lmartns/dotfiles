return {
	"rebelot/kanagawa.nvim",
	lazy = false, -- Carregar imediatamente
	priority = 1000, -- Definir prioridade alta
	config = function()
	  require("kanagawa").setup({
		compile = false,             -- Ativar compilação para melhor desempenho (use `:KanagawaCompile` após mudanças)
		undercurl = true,            -- Ativar undercurls
		commentStyle = { italic = true },
		keywordStyle = { italic = true },
		statementStyle = { bold = true },
		transparent = false,         -- Desativar fundo transparente
		dimInactive = false,         -- Não escurecer janelas inativas
		terminalColors = true,       -- Aplicar cores ao terminal
		theme = "wave",              -- Padrão: "wave" (pode ser "dragon" ou "lotus")
		background = {               -- Definir cores para os modos claro/escuro
		  dark = "dragon",
		  light = "lotus",
		},
	  })
  
	  -- Aplicar o esquema de cores
	  vim.cmd("colorscheme kanagawa")
	end
  }
  