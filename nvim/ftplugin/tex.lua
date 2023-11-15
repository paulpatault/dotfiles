vim.keymap.set("v", "<C-b>", "<Plug>(sandwich-add)ctextbf<cr>")
vim.keymap.set("v", "<C-i>", "<Plug>(sandwich-add)ctextit<cr>")
vim.keymap.set("v", "<C-e>", "<Plug>(sandwich-add)cemph<cr>")
vim.keymap.set("v", "<C-t>", "<Plug>(sandwich-add)ctexttt<cr>")
vim.keymap.set("n", "<leader>i", "i~$$<esc>i")

vim.keymap.set("n", "<localleader>t", "<Plug>(vimtex-toc-toggle)")
vim.keymap.set("n", "<localleader>T", "<Plug>(vimtex-toc-toggle)")
vim.keymap.set("n", "<localleader>l", "<Plug>(vimtex-compile)")
vim.keymap.set("n", "<localleader>e", "<Plug>(vimtex-errors)")
vim.keymap.set("n", "<localleader>v", "<Plug>(vimtex-view)")

vim.keymap.set("n", "<localleader>w", [[/\(\<\w\+\>\)\_s*\<\1\><cr>]])
