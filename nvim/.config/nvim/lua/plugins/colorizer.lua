return {
  "norcalli/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("colorizer").setup({
      "*", -- Ativa para todos os filetypes
      css = { css = true, css_fn = true },
      html = { names = false }, -- Não destaca nomes de cores em HTML
    }, {
      mode = "background", -- Destaca o fundo com a cor
      RGB = true, -- #RGB hex codes
      RRGGBB = true, -- #RRGGBB hex codes
      names = true, -- Nomes de cores como "Blue"
      RRGGBBAA = true, -- #RRGGBBAA hex codes
      rgb_fn = true, -- CSS rgb() e rgba()
      hsl_fn = true, -- CSS hsl() e hsla()
      css = false, -- Ativa todos os recursos CSS
      css_fn = false, -- Ativa todas as funções CSS
    })
  end,
}
