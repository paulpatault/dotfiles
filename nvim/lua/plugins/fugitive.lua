return {
  "tpope/vim-fugitive",

  config = function()
    vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "[G]it + [S]tatus" })
    vim.keymap.set("n", "<leader>fg", function() vim.cmd("tab Git") end, { desc = "[G]it + [S]tatus" })
    vim.keymap.set("n", "<leader>gl", function() vim.cmd("tab Git log") end, { desc = "[G]it + [L]og" })
    vim.keymap.set("n", "<leader>gb", function() vim.cmd.Git("blame") end, { desc = "[G]it + [B]lame" })
    vim.keymap.set("n", "<leader>gd", function() vim.cmd("Gvdiffsplit") end, { desc = "[G]it + [D]iff" })

    local fugitive_grp = vim.api.nvim_create_augroup("fugitive_grp", {clear = true})

    vim.api.nvim_create_autocmd("BufWinEnter", {
        group = fugitive_grp,
        pattern = "*",
        callback = function()

            local bufnr = vim.api.nvim_get_current_buf()
            local opts = { buffer = bufnr, remap = false }

            if vim.bo.ft == "fugitiveblame" or vim.bo.ft == "fugitive" then
              vim.keymap.set("n", "q", function() vim.cmd.quit() end, opts)
            end

            if vim.bo.ft ~= "fugitive" then return end

            vim.keymap.set("n", "<leader>p", function()
                vim.cmd.Git("push")
                vim.cmd.quit()
            end, opts)

            vim.keymap.set("n", "<leader>f", function()
                vim.cmd.Git("push --force-with-lease")
                vim.cmd.quit()
            end, opts)

            -- rebase always
            vim.keymap.set("n", "<leader>P", function()
                vim.cmd.Git({"pull",  "--rebase=true"})
            end, opts)


        end,
    })
  end }
