return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  config = function()
    require("toggleterm").setup({
      direction = "float",
      highlights = {
        NormalFloat = {
          link = "Normal",
        },
      },
      shade_terminals = false,
    })
  end,
}
