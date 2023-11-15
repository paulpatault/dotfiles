return {
  "sbdchd/neoformat",

  config = function()
    vim.keymap.set("n", "<leader>fm", function() vim.cmd("Neoformat")() end, { desc = "[F]ile + [F]ormat" })
  end
}
