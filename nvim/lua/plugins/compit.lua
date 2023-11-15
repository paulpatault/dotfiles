return {
  "paulpatault/compit",

  config = function()

    local function compit()
      require('compit').run({ prompt = false })
    end

    local function compit_prompt()
      require('compit').run({})
    end

    vim.keymap.set("n", "<localleader>bb", compit_prompt, { desc = "[BB]uild with prompt" })
    vim.keymap.set("n", "<localleader>b",  compit, { desc = "[B]uild" })
    --[[ vim.keymap.set("n", "<leader>m", function()
      local tmp = vim.opt.makeprg
      vim.opt.makeprg = "make"
      vim.cmd.make()
      vim.opt.makeprg = tmp
    end, { desc = "[M]ake" }) ]]
  end
}

