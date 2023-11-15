return {
  "folke/zen-mode.nvim",
  -- "folke/twilight.nvim",

  config = function()

    local zen_mode = require("zen-mode")

    zen_mode.setup {
      window = {
        width = 100,
        options = {
          --[[ number = true, relativenumber = true, ]]
        }
      },
    }

    vim.keymap.set("n", "<leader>zz", zen_mode.toggle, { desc = "[Z]en mode" })
    vim.keymap.set("n", "<C-c><C-z>", zen_mode.toggle, { desc = "[Z]en mode" })

  end }
