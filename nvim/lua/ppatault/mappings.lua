vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "file browser" })

vim.keymap.set("n", "<leader>bc", "f,a<cr><esc>", { desc = "[B]reak on [C]omma" })
vim.keymap.set("n", "<leader>bs", "f;a<cr><esc>", { desc = "[B]reak on [S]emicolon" })

-- vim.keymap.set("n", "<leader>io", "ebb%beve%eeeebdbb*vepNbv%ed", { desc = "inline ocaml" })

-- vim.keymap.set("n", "<leader>sp", function() vim.cmd.setlocal("spell!")() end)
vim.keymap.set("n", "<leader>m",  function() print("[make]") vim.cmd([[ Neomake! ]]) end)


vim.keymap.set("t", "<esc>", "<c-\\><c-n>", { desc = "[esc] from terminal"})

vim.keymap.set("n", "<leader>rt", [[:%s/\s\+$//e<cr>]], { desc = "[R]emove + [T]railling" })

vim.keymap.set("v", "<C-d>", "<C-d>zz", { desc = "" })
vim.keymap.set("v", "<C-u>", "<C-u>zz", { desc = "" })
vim.keymap.set("v", "(", "(zz", { desc = "" })
vim.keymap.set("v", ")", ")zz", { desc = "" })
vim.keymap.set("v", "{", "{zz", { desc = "" })
vim.keymap.set("v", "}", "}zz", { desc = "" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "" })
vim.keymap.set("n", "(", "(zz", { desc = "" })
vim.keymap.set("n", ")", ")zz")
vim.keymap.set("n", "{", "{zz")
vim.keymap.set("n", "}", "}zz", { desc = "" })

vim.keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz", { desc = "" })
vim.keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz", { desc = "" })

vim.keymap.set("n", "n", "nzz", { desc = "" })
vim.keymap.set("n", "N", "Nzz", { desc = "" })

vim.keymap.set("i", "jj", "<esc>", { desc = "" })
vim.keymap.set("i", "jk", "<esc>", { desc = "" })

vim.keymap.set("n", "<A-Tab>",   vim.cmd.tabnext, { desc = "" })
vim.keymap.set("n", "<A-S-Tab>", vim.cmd.tabprev, { desc = "" })

vim.keymap.set("n", "J", "mzJ`z", { desc = "" })

vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv", { desc = "" })
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv", { desc = "" })

-- vim.keymap.set("n", "P", "\"_dP", { desc = "" })

vim.keymap.set("n", "²", [["_]], { desc = "" })

vim.keymap.set("n", "<esc><esc>", vim.cmd.nohlsearch, { desc = "[esc] hlsearch" })

vim.keymap.set("n", "<right>", "xp", { desc = "move char [right]" })
vim.keymap.set("n", "<left>", "hxph", { desc = "move char [left]" })

vim.keymap.set("v", "<Tab>",   ">gv", { desc = "indent" })
vim.keymap.set("v", "<S-Tab>", "<gv", { desc = "unindent" })

vim.keymap.set("n", "<leader>bib", function()
  vim.cmd("tabnew")
  local path = "~/d/git/toccata/biblio"
  vim.cmd.tcd(path)
  vim.cmd.e(path .. "/team.bib")
end, { desc = "[BIB]tex toccata" })

local putils = require("ppatault.utils")

vim.keymap.set("n", "<leader>w", putils.wrap_toogle, { desc = "[W]rap toogle" })
vim.keymap.set("n", "<leader>vec", putils.vec, { desc = "[V]im [E]dit [C]onfig" })

--- CC


vim.keymap.set("n", "<C-c><C-n>", function()
        vim.wo.relativenumber = not vim.wo.relativenumber
        vim.wo.number = not vim.wo.number
  end, { desc = "toogle [n]umbers" })

