return {

  "natecraddock/workspaces.nvim",
  config = function()
    local workspaces = require("workspaces")

    workspaces.setup({
      -- Path to save workspace data (default)
      path = vim.fn.stdpath("data") .. "/workspaces",

      -- Type of directory change: "global", "local", or "tab"
      cd_type = "global",

      -- Sort workspaces by recent use
      sort = true,
      mru_sort = true,

      -- Hooks to run after opening a workspace
      hooks = {
        open = {
          "Telescope find_files", -- open file finder
          "Telescope live_grep", -- open text search
        },
      },

      -- Notifications when adding/removing workspace
      notify_info = true,
    })

    -- Keymaps to manage workspaces
    vim.keymap.set("n", "<leader>wo", workspaces.open, { desc = "Open workspace" })
    vim.keymap.set("n", "<leader>wa", function()
      -- Add workspace with current name and path
      local name = vim.fn.input("Workspace name: ")
      local path = vim.fn.input("Workspace path: ", vim.fn.getcwd(), "dir")
      if name ~= "" and path ~= "" then
        workspaces.add(path, name)
        print("Workspace '" .. name .. "' added.")
      else
        print("Invalid name or path.")
      end
    end, { desc = "Add workspace" })
    vim.keymap.set("n", "<leader>wr", function()
      local name = vim.fn.input("Workspace name to remove: ")
      if name ~= "" then
        workspaces.remove(name)
        print("Workspace '" .. name .. "' removed.")
      else
        print("Invalid name.")
      end
    end, { desc = "Remove workspace" })
  end,
}
