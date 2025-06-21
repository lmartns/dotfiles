return {
  "ThePrimeagen/harpoon",
  config = function()
    local mark = require("harpoon.mark")
    local ui = require("harpoon.ui")

    vim.keymap.set("n", "<leader>a", mark.add_file, { desc = "Add file to Harpoon" })
    vim.keymap.set("n", "<leader>h", ui.toggle_quick_menu, { desc = "Toggle Harpoon menu" })
    vim.keymap.set("n", "<leader>1", function()
      ui.nav_file(1)
    end, { desc = "Go to Harpoon file 1" })
    vim.keymap.set("n", "<leader>2", function()
      ui.nav_file(2)
    end, { desc = "Go to Harpoon file 2" })
    vim.keymap.set("n", "<leader>3", function()
      ui.nav_file(3)
    end, { desc = "Go to Harpoon file 3" })
    vim.keymap.set("n", "<leader>r", function()
      local mark = require("harpoon.mark")
      local filepath = vim.fn.expand("%:p")
      mark.rm_file(filepath)
      print("Arquivo removido do Harpoon: " .. filepath)
    end, { desc = "Remover arquivo do Harpoon" })
  end,
}
