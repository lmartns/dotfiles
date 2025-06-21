return {
  "epwalsh/obsidian.nvim",
  version = "*", -- Recomendo usar uma versão estável
  lazy = true,

  event = {
    "BufReadPre " .. vim.fn.expand("~") .. "/Caminho/Para/Seu/CofreObsidian/**.md",
    "BufNewFile " .. vim.fn.expand("~") .. "/Caminho/Para/Seu/CofreObsidian/**.md",
  },

  dependencies = {
    "nvim-lua/plenary.nvim",
  },

  opts = {
    dir = "~/Documents/Vault/",

    search = {
      enable = true,
      backend = "telescope",
    },
  },

  keys = {
    { "<leader>oo", "<cmd>ObsidianQuickSwitch<CR>", desc = "Buscar/Abrir nota (Obsidian)" },

    {
      "<leader>on",
      function()
        vim.cmd.ObsidianNew()
      end,
      desc = "Nova nota (Obsidian)",
    },
  },
}
