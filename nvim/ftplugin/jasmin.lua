
vim.api.nvim_create_autocmd( {"BufRead","BufWinEnter","FileType"}, {
  group = vim.api.nvim_create_augroup("jasminGRP", {clear = true}),
  pattern = { "*.j", "*.k" },
  callback = function ()
    if vim.bo.ft ~= "jasmin" then return end

    vim.keymap.set("n", "<localleader>i", function()
      vim.cmd("!jasmin %")
      vim.cmd("!java %:r.class")
    end, { desc = "Jasmin + Java" })

    vim.keymap.set("n", "<localleader>j", function()
      vim.cmd("!jasmin %")
    end, { desc = "Jasmin compile" })

    vim.keymap.set("n", "<localleader>f", function()
      vim.cmd("!jasmin %")
      vim.cmd("!java -noverify %:r.class")
    end, { desc = "Jasmin + Java :: [noverify]" })

    vim.keymap.set("n", "<leader>j", function() vim.cmd("e %:r.fx") end, { desc = "goto [F]opix from [J]asmin" })

  end
})
