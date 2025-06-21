return {
  {
    "folke/zen-mode.nvim",
    opts = {},
    keys = {
      { "<leader>z", "<cmd>ZenMode<CR>", desc = "Entrar no Modo Zen" },
    },
  },
  {
    "folke/twilight.nvim",
    opts = {},
  },
  {
    "junegunn/limelight.vim",
  },
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = true,
  },
}
