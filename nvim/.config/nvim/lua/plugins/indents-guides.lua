return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  config = function()
    local hooks = require("ibl.hooks")

    -- Cria os grupos de highlight com as cores do Gruvbox
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      -- Cor para o escopo atual (onde o cursor está)
      vim.api.nvim_set_hl(0, "IblScope", { fg = "#83a598" })

      -- Cor para indentação normal (mais sutil)
      vim.api.nvim_set_hl(0, "IblIndent", { fg = "#504945" })
    end)

    require("ibl").setup({
      indent = {
        char = "│",
        highlight = "IblIndent",
      },
      scope = {
        enabled = true,
        char = "│",
        highlight = "IblScope",
        show_exact_scope = true,
        include = {
          node_type = {
            ["*"] = { "*" }, -- Isso faz com que todos os tipos de nós sejam incluídos
          },
        },
      },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    })
  end,
}
