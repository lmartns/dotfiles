return {
  "folke/snacks.nvim",
  opts = {
    picker = {
      sources = {
        explorer = {
          layout = {
            layout = { position = "right" },
          },
          tree = true,
          watch = true,
          diagnostics = true,
          diagnostics_open = false,
          git_status = true,
          git_status_open = false,
          git_untracked = true,
          follow_file = true,
          focus = "list",
          auto_close = false,
          jump = { close = false },
          preview = false,

          formatters = {
            file = { filename_only = true },
            severity = { pos = "right" },
          },

          matcher = { sort_empty = false, fuzzy = false },

          win = {
            list = {
              keys = {
                ["<BS>"] = "explorer_up",
                ["l"] = "confirm",
                ["h"] = "explorer_close", -- fechar diretório

                ["a"] = "explorer_add", -- adicionar arquivo/pasta
                ["d"] = "explorer_del", -- deletar
                ["r"] = "explorer_rename", -- renomear
                ["c"] = "explorer_copy",
                ["m"] = "explorer_move",
                ["y"] = { "explorer_yank", mode = { "n", "x" } }, -- yank (copiar)
                ["p"] = "explorer_paste", -- colar

                ["o"] = "explorer_open",
                ["P"] = "toggle_preview", -- toggle preview
                ["u"] = "explorer_update", -- atualizar

                ["<c-c>"] = "tcd",
                ["<leader>/"] = "picker_grep",
                ["<c-t>"] = "terminal",
                ["."] = "explorer_focus",

                ["I"] = "toggle_ignored", -- toggle arquivos ignorados
                ["H"] = "toggle_hidden", -- toggle arquivos ocultos
                ["Z"] = "explorer_close_all", -- fechar todas as pastas

                ["<C-h>"] = function()
                  vim.cmd("wincmd h")
                end,
                ["<C-j>"] = function()
                  vim.cmd("wincmd j")
                end,
                ["<C-k>"] = function()
                  vim.cmd("wincmd k")
                end,
                ["<C-l>"] = function()
                  vim.cmd("wincmd l")
                end,

                -- Navegação por git/diagnostics
                ["]g"] = "explorer_git_next",
                ["[g"] = "explorer_git_prev",
                ["]d"] = "explorer_diagnostic_next",
                ["[d"] = "explorer_diagnostic_prev",
                ["]w"] = "explorer_warn_next",
                ["[w"] = "explorer_warn_prev",
                ["]e"] = "explorer_error_next",
                ["[e"] = "explorer_error_prev",
              },
            },
          },
        },
      },
    },
  },
}
