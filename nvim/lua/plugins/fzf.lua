return {
  "junegunn/fzf.vim",
  dependencies = { "junegunn/fzf" },
  config = function()
    vim.keymap.set("n", "<leader>pf", function() vim.cmd("Files") end,    { desc = "p + [F]iles" })
    vim.keymap.set("n", "<leader>pg", function() vim.cmd("GFiles") end,   { desc = "p + [G]it files" })
    vim.keymap.set("n", "<leader>pb", function() vim.cmd("Buffers") end,  { desc = "p + [B]uffer" })
    vim.keymap.set("n", "<leader>ph", function() vim.cmd("Helptags") end, { desc = "p + [H]elp tags" })
    vim.keymap.set("n", "<leader>pr", function() vim.cmd("Rg") end,       { desc = "p + [R]ipgrep" })
    vim.keymap.set("n", "<leader>pw", function() vim.cmd("Windows") end,  { desc = "p + [W]indows" })
    vim.keymap.set("n", "<leader>pm", function() vim.cmd("Marks") end,    { desc = "p + [M]arks" })

    --[[ vim.api.nvim_create_autocmd({"FileType"}, {
      pattern = { "fzf" },
      callback = function()
        -- vim.keymap.set({"i"}, "<esc>", function() vim.cmd.quit() end)
        vim.keymap.set({"n"}, "<esc><esc>", function() vim.cmd.quit() end)
      end,
      group   = vim.api.nvim_create_augroup("fzf_grp", {clear = true})
    }) ]]

  end
}
