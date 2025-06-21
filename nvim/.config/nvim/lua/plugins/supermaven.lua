return {
  "supermaven-inc/supermaven-nvim",
  lazy = false,
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<C-t>",
        clear_suggestion = "<C-a>",
      },
      disable_inline_completion = false,
      color = {
        cterm = 244,
      },
    })
  end,
}
