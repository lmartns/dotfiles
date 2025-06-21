return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    require("neodev").setup()

    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      underline = true,
      update_in_insert = false,
      severity_sort = true,
      deduplicate = true,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(event)
        local keymap = vim.keymap

        if vim.lsp.inlay_hint then
          vim.lsp.inlay_hint.enable(true, { bufnr = event.buf })
        end

        keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration", buffer = event.buf })
        keymap.set(
          { "n", "v" },
          "<leader>ca",
          vim.lsp.buf.code_action,
          { desc = "See available code actions", buffer = event.buf }
        )
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename", buffer = event.buf })
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show line diagnostics", buffer = event.buf })
        keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic", buffer = event.buf })
        keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic", buffer = event.buf })
        keymap.set(
          "n",
          "K",
          vim.lsp.buf.hover,
          { desc = "Show documentation for what is under cursor", buffer = event.buf }
        )

        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", { desc = "Show LSP references", buffer = event.buf })
        keymap.set(
          "n",
          "gd",
          "<cmd>Telescope lsp_definitions<CR>",
          { desc = "Show LSP definitions", buffer = event.buf }
        )
        keymap.set(
          "n",
          "gi",
          "<cmd>Telescope lsp_implementations<CR>",
          { desc = "Show LSP implementations", buffer = event.buf }
        )
        keymap.set(
          "n",
          "gt",
          "<cmd>Telescope lsp_type_definitions<CR>",
          { desc = "Show LSP type definitions", buffer = event.buf }
        )
        keymap.set(
          "n",
          "<leader>D",
          "<cmd>Telescope diagnostics bufnr=0<CR>",
          { desc = "Show buffer diagnostics", buffer = event.buf }
        )

        keymap.set("n", "<leader>rs", ":LspRestart<CR>", { desc = "Restart LSP", buffer = event.buf })
      end,
    })
  end,
}
