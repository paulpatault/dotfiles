M = {}

function M.wrap_toogle ()
    vim.wo.wrap = not vim.wo.wrap
    if vim.wo.wrap then
        vim.keymap.set("n", "j", "gj", { desc = "auto" })
        vim.keymap.set("n", "k", "gk", { desc = "auto" })
        vim.keymap.set("n", "0", "g0", { desc = "auto" })
        vim.keymap.set("n", "$", "g$", { desc = "auto" })
        vim.keymap.set("v", "j", "gj", { desc = "auto" })
        vim.keymap.set("v", "k", "gk", { desc = "auto" })
        vim.keymap.set("v", "0", "g0", { desc = "auto" })
        vim.keymap.set("v", "$", "g$", { desc = "auto" })
        vim.cmd.let("&showbreak=' ❯❯❯ '")
        vim.cmd.set("cpoptions+=n")
    else
        pcall(function() vim.keymap.del("n", "j") end)
        pcall(function() vim.keymap.del("n", "k") end)
        pcall(function() vim.keymap.del("n", "0") end)
        pcall(function() vim.keymap.del("n", "$") end)
        pcall(function() vim.keymap.del("v", "j") end)
        pcall(function() vim.keymap.del("v", "k") end)
        pcall(function() vim.keymap.del("v", "0") end)
        pcall(function() vim.keymap.del("v", "$") end)
        vim.cmd.set("showbreak=")
        vim.cmd.set("cpoptions-=n")
    end
end

function M.vec()
  vim.cmd("tabnew")
  local path = vim.fn.stdpath("config")
  vim.cmd.tcd(path)
  vim.cmd.e(path .. "/init.lua")
end

--[[ local gospel = false
function Toogle_gospel()
  gospel = not gospel
  if gospel then
    vim.opt.makeprg = "gospel check %"
    print "gospel [on]"
  else
    -- vim.opt.makeprg = "dune build"
    vim.cmd ":e"
    print "gospel [off]"
  end
end

utils.map_lua('n', '<C-g>',  "Toogle_gospel()", options) ]]


return M
