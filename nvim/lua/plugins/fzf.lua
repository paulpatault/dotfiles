return {
  "junegunn/fzf.vim",
  dependencies = { "junegunn/fzf" },
  config = function()
    vim.keymap.set("n", "<leader>f", function() vim.cmd("Files") end,    { desc = "p + [F]iles" })
    vim.keymap.set("n", "<leader>g", function() vim.cmd("GFiles") end,   { desc = "p + [G]it files" })
    vim.keymap.set("n", "<leader>b", function() vim.cmd("Buffers") end,  { desc = "p + [B]uffer" })
    vim.keymap.set("n", "<leader>h", function() vim.cmd("Helptags") end, { desc = "p + [H]elp tags" })
    vim.keymap.set("n", "<leader>rg", function() vim.cmd("Rg") end,       { desc = "p + [R]ipgrep" })
    vim.keymap.set("n", "<leader>w", function() vim.cmd("Windows") end,  { desc = "p + [W]indows" })
    vim.keymap.set("n", "<leader>m", function() vim.cmd("Marks") end,    { desc = "p + [M]arks" })

    vim.g.fzf_colors =
     { fg=      {'fg', 'Normal'},
       bg=      {'bg', 'Normal'},
       hl=      {'fg', 'Comment'},
       info=    {'fg', 'PreProc'},
       border=  {'fg', 'Ignore'},
       prompt=  {'fg', 'Conditional'},
       pointer= {'fg', 'Exception'},
       marker=  {'fg', 'Keyword'},
       spinner= {'fg', 'Label'},
       header=  {'fg', 'Comment'} }

    vim.g.fzf_colors['fg+'] = {'fg', 'CursorLine', 'CursorColumn', 'Normal'}
    vim.g.fzf_colors['bg+'] = {'bg', 'CursorLine', 'CursorColumn'}
    vim.g.fzf_colors['hg+'] = {'fg', 'Statement'}
  end
}
