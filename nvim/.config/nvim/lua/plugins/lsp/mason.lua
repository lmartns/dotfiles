return {
  "mason-org/mason.nvim",
  dependencies = {
    "mason-org/mason-lspconfig.nvim",
  },

  ensure_installed = {
    "stylua",
    "prettier",
    "astro",
    "biome",
    "lua_ls",
    "ts_ls",
    "html",
    "cssls",
    "sqlls",
    "clangd",
    "gopls",
    "rust-analyzer",
    "svelteserver",
    "tailwindcss",
  },

  config = function()
    local mason = require("mason")
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup()

    mason_lspconfig.setup({
      automatic_installation = true,
    })
  end,
}
