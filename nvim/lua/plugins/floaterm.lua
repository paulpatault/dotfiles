return {
  "voldikss/vim-floaterm",
  config = function()

    vim.keymap.set("n", "<leader>tg",
      function() vim.cmd("FloatermNew --height=0.9 --width=0.9 lazygit") end, { desc = "[T]erminal + [G]it" })


    vim.keymap.set("n", "<leader>ff", function() vim.cmd("FloatermNew") end, { desc = "[F]loaterm [F]create" })
    vim.keymap.set("n", "<leader>fN", function() vim.cmd("FloatermPrev") end, { desc = "[F]loaterm [n]next" })
    vim.keymap.set("n", "<leader>fn", function() vim.cmd("FloatermNext") end, { desc = "[F]loaterm [N]Prev" })
    vim.keymap.set("n", "<leader>ft", function() vim.cmd("FloatermToggle") end, { desc = "[F]loaterm [T]oggle" })
    vim.keymap.set("n", "<leader>fk", function() vim.cmd("FloatermKill") end, { desc = "[F]loaterm [K]ill" })
    vim.keymap.set("n", "<leader>fh", function() vim.cmd("FloatermHide") end, { desc = "[F]loaterm [H]ide" })

  end
}
