return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-path",
  },
  opts = function(_, opts)
    local cmp = require("cmp")

    opts.sources = cmp.config.sources({
      { name = "nvim_lsp" },
      {
        name = "path",
        option = {
          trailing_slash = true,
          label_trailing_slash = true,
        },
      },
      { name = "buffer" },
    })

    opts.completion = opts.completion or {}
    opts.completion.keyword_length = 1
    opts.completion.keyword_pattern = [[\k\+]]

    opts.experimental = opts.experimental or {}
    opts.experimental.ghost_text = true

    opts.mapping = vim.tbl_extend("force", opts.mapping or {}, {
      ["<CR>"] = cmp.mapping({
        i = function(fallback)
          if cmp.visible() and cmp.get_active_entry() then
            cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
          else
            fallback()
          end
        end,
        s = cmp.mapping.confirm({ select = true }),
        c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
      }),
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          if cmp.get_active_entry() then
            cmp.confirm({ select = false })
          else
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
          end
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<C-Space>"] = cmp.mapping.complete(),
    })

    return opts
  end,
}
