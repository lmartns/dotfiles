return {
  "lewis6991/gitsigns.nvim",
  ft = { "gitcommit", "diff" },
  event = "VeryLazy",
  init = function()
    vim.api.nvim_create_autocmd({ "BufRead" }, {
      group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
      callback = function()
        vim.fn.system("git -C " .. '"' .. vim.fn.expand("%:p:h") .. '"' .. " rev-parse")
        if vim.v.shell_error == 0 then
          vim.api.nvim_del_augroup_by_name("GitSignsLazyLoad")
          vim.schedule(function()
            require("lazy").load({ plugins = { "gitsigns.nvim" } })
          end)
        end
      end,
    })
  end,
  config = function()
    local opts = {}

    local on_attach = function(bufnr)
      local gitsigns = require("gitsigns")

      local function map(mode, l, r, o)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, o)
      end

      map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "Reset hunk" })
      map("n", "<leader>hi", gitsigns.preview_hunk_inline, { desc = "Preview hunk inline" })
      map("n", "<leader>hn", gitsigns.next_hunk, { desc = "Next hunk" })
      map("n", "<leader>hp", gitsigns.prev_hunk, { desc = "Prev hunk" })
      map("n", "<leader>gb", gitsigns.toggle_current_line_blame, { desc = "Toggle Git Blame na Linha" })
    end

    require("gitsigns").setup({
      on_attach = on_attach,
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        untracked = { text = "?" },
        delete = { text = "-" },
        changedelete = { text = "~" },
      },
      current_line_blame = true,
    })
  end,
}
