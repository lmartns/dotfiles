return {
  "saghen/blink.cmp",
  version = "1.*",

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "enter" },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
      },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        cmdline = {
          enabled = function()
            return not vim.fn.getcmdline():match("vimgrep")
          end,
        },
      },
    },
    fuzzy = { implementation = "prefer_rust_with_warning" },
    cmdline = {
      keymap = { preset = "super-tab" },
      completion = { menu = { auto_show = true } },
    },
  },
  opts_extend = { "sources.default" },
}
