vim.keymap.set("n", "<esc>", function() vim.cmd("FloatermHide") end, {desc = "Hide floaterm"} )
vim.keymap.set("i", "<esc><esc>", function() vim.cmd("FloatermHide") end, {desc = "Hide floaterm"} )
