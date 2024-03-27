vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "file browser" })

vim.keymap.set("n", "<leader>bc", "f,a<cr><esc>", { desc = "[B]reak on [C]omma" })
vim.keymap.set("n", "<leader>bs", "f;a<cr><esc>", { desc = "[B]reak on [S]emicolon" })

-- vim.keymap.set("n", "<leader>m",  function() print("[make]") vim.cmd([[ Neomake! ]]) end)

vim.keymap.set("n", "<leader>rt", [[:%s/\s\+$//e<cr>]], { desc = "[R]emove + [T]railling" })

vim.keymap.set("t", "<esc>", "<c-\\><c-n>", { desc = "[esc] from terminal"})

vim.keymap.set({"v","n"}, "<C-d>", "<C-d>zz")
vim.keymap.set({"v","n"}, "<C-u>", "<C-u>zz")
vim.keymap.set({"v","n"}, "(", "(zz")
vim.keymap.set({"v","n"}, ")", ")zz")
vim.keymap.set({"v","n"}, "{", "{zz")
vim.keymap.set({"v","n"}, "}", "}zz")
vim.keymap.set({"v","n"}, "n", "nzz")
vim.keymap.set({"v","n"}, "N", "Nzz")

vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")

vim.keymap.set("i", "jj", "<esc>")
vim.keymap.set("i", "jk", "<esc>")

vim.keymap.set("n", "<A-Tab>",   vim.cmd.tabnext)
vim.keymap.set("n", "<A-S-Tab>", vim.cmd.tabprev)

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

-- vim.keymap.set("n", "P", "\"_dP")

vim.keymap.set("n", "<esc><esc>", vim.cmd.nohlsearch, { desc = "[esc] hlsearch" })

vim.keymap.set("n", "<right>", "xp",  { desc = "move char [right]" })
vim.keymap.set("n", "<left>", "hxph", { desc = "move char [left]" })

vim.keymap.set("v", "<Tab>",   ">gv", { desc =   "indent" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "unindent" })

--[[ vim.keymap.set("n", "<leader>bib", function()
  vim.cmd("tabnew")
  local path = "~/git/toccata/biblio"
  vim.cmd.tcd(path)
  vim.cmd.e(path .. "/team.bib")
end, { desc = "[BIB]tex toccata" }) ]]

local putils = require("ppatault.utils")

vim.keymap.set("n", "<C-c><C-w>", putils.wrap_toogle, { desc = "[W]rap toogle" })
vim.keymap.set("n", "<leader>vec", putils.vec, { desc = "[V]im [E]dit [C]onfig" })

vim.api.nvim_create_user_command('Light', function()
   vim.cmd("colorscheme solarized8_flat")
   vim.o.background='light' end, {})

vim.api.nvim_create_user_command('Dark', function()
   vim.cmd("colorscheme gruvbox")
   vim.o.background='dark' end, {})

vim.keymap.set("n", "<leader>tn", function()
        vim.wo.relativenumber = not vim.wo.relativenumber
        vim.wo.number = not vim.wo.number
  end, { desc = "toogle [n]umbers" })

