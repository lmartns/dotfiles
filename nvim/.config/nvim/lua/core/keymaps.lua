---@diagnostic disable: undefined-global
vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line(s) down" }) -- move selected line(s) down
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line(s) up" }) -- move selected line(s) up

keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")

keymap.set("n", "<leader>y", '"+y')
keymap.set("v", "<leader>y", '"+y')

keymap.set("n", "<leader>bc", "<cmd>BufferLinePickClose<CR>", { desc = "Choose buffer to close" })

keymap.set("n", "<leader>bx", "<cmd>bp|bd #<CR>", { desc = "Close buffer but keep window" })

keymap.set("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

keymap.set("n", "<leader>bb", "<cmd>BufferLinePick<CR>", { desc = "Pick a buffer" })

keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Open floating terminal" })

keymap.set("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<CR>", { desc = "Open horizontal terminal" })

keymap.set("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<CR>", { desc = "Open vertical terminal" })

vim.keymap.set("n", "<Tab>", "i<Tab><Esc>l", { noremap = true })

keymap.set({ "n", "v" }, "y", '"+y', { noremap = true })
keymap.set("n", "yy", '"+yy', { noremap = true })

keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })

keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })

local function toggle_checklist()
  local line = vim.api.nvim_get_current_line()
  local modified = false

  local new_line, count1 = line:gsub("%- %[ %]", "- [x]", 1)
  if count1 > 0 then
    modified = true
  end

  if not modified then
    new_line, count2 = line:gsub("%- %[x%]", "- [ ]", 1)
    if count2 > 0 then
      modified = true
    end
  end

  if modified then
    vim.api.nvim_set_current_line(new_line)
  end
end

keymap.set("n", "<leader>cx", toggle_checklist, { desc = "Alternar checklist do Markdown" })

keymap.set("n", "<leader>fn", "<cmd>enew<CR>", { desc = "New file" })

keymap.set("n", "<leader>yp", function()
  local file_path = vim.fn.expand("%:p")
  vim.fn.setreg("+", file_path)
end, { desc = "Copy path" })

keymap.set("n", "<leader>yr", function()
  local relative_path = vim.fn.expand("%")
  vim.fn.setreg("+", relative_path)
end, { desc = "Copy relative_path" })
