return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      options = {
        signcolumn = "no",
        number = false,
        relativenumber = false,
      },
    },
    plugins = {
      gitsigns = { enabled = false },
      tmux = { enabled = false },
      kitty = { enabled = false },
      wezterm = { enabled = false },
    },
  },
}
