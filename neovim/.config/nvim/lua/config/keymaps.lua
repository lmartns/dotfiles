local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })
keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Open floating terminal" })
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left split" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower split" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper split" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right split" })
keymap.set("n", "H", "<Nop>", { noremap = true, silent = true, desc = "Disable Shift+H" })
keymap.set("n", "L", "<Nop>", { noremap = true, silent = true, desc = "Disable Shift+L" })
